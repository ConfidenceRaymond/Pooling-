#####################################
## Import the necessary libraries ###
#####################################

from __future__ import division, print_function, absolute_import

from skimage import color, io
from scipy.misc import imresize
import numpy as np
import os
from glob import glob
import cv2

from six.moves import cPickle
import pickle


np.set_printoptions(suppress=True)
########################################
### Imports picture files
########################################

# Yes = Tumour = 0
# No = No_Tumor = 1


files_path_Yes = 'Yes/'
files_path_No = 'No/'


Yes_path_tumor = os.path.join(files_path_Yes, 'image*.jpg')
No_path_tumor = os.path.join(files_path_No, 'image*.jpg')


print("Yes_path")

Yes_tumor = sorted(glob(Yes_path_tumor))
No_tumor = sorted(glob(No_path_tumor))


n_files = len(Yes_tumor) + len(No_tumor)
print("######print here")
print(n_files)
print("##########")

size_image = 64

allX = np.zeros((n_files, size_image, size_image, 3), dtype='uint8')
ally = np.zeros((n_files), dtype='int32')
count = 0
y_count = 0
for f in Yes_tumor:
    try:
        img = io.imread(f)
        new_img = imresize(img, (size_image, size_image, 3))
        allX[count] = np.array(new_img)
        ally[y_count] = 0
        count += 1
        y_count += 1
    except:
        continue

print("Yes_tumor done")
for f in No_tumor:
    try:
        img = io.imread(f)
        new_img = imresize(img, (size_image, size_image, 3))
        allX[count] = np.array(new_img)
        ally[y_count] = 1
        count += 1
        y_count += 1
    except:
        continue
print("No_tumor done")

print("images are arrayed")

print("data are split")

f = open('brain_tumor_dataset.pkl', 'wb')

print("pickle file open")
cPickle.dump((allX, ally), f, protocol=cPickle.HIGHEST_PROTOCOL)
print("pickle dumped")
f.close()

print("finished")