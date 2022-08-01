Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB9D7F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 17:01:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x39so8700166lfu.7
        for <llvm@lists.linux.dev>; Mon, 01 Aug 2022 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ixsVwO2QtG1s7F+Wj4IBrIuh+AcmsWPUXBYp7QCXLCo=;
        b=gdMJN5rdem/sDM1/rhDE1ZC6owcaB06hfCpuvBOZOEs4V4idRSGYK5xsCFXC6eLUry
         OBRnX4HEmi/VpvSDl9DHZ2f/vXCveUEENtHkxX1NQ14MaN5nNcMdhlGXAqps3bvrlF8L
         kWzH8jBkgAtah1BltIM78/e2tK1Tbn/yu73b+C/kGtZiQMTB7zurMBXlwPxj9hSy6sxr
         ZSuBSqZKmGdPy6hVn5X4na7GJTq58LQXxOI6lJsWF23tGEbPgxipcsXllKSIjt9ltA8w
         1MZqjF7GzA29lPnUNHEgdr7aIbG91fTJMUKA7a7JQaQGBoF8IWtC2JwwmpIeYFPL77Mt
         nWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ixsVwO2QtG1s7F+Wj4IBrIuh+AcmsWPUXBYp7QCXLCo=;
        b=O0CvDi+LTIk1qRGs07lUO+BzUBl6fhGanqdC+tGX1wlQwSAqsFiJToYSkNwX9gvED/
         uNGjqbaL1VfTXRFtJ3qHBrE4/yCJaB0Ct23QIuPLuDRlLw/+YROyUeDyuo9X9l3LzXda
         CNRBZJY3xVoo/SXEaWpWq4zxeq4Tp6Ad6w3fhnhduhFEud83v55WgBX7/LI396qYrEJv
         pVQtHBB89DMwSK1XDuOJEKwmv5azeO6FAK02/bRvS1EaP8wz0UhiYuJKX+OOV9jgp/L6
         Xbn83x9YsjnwDfMllgJwW1g5A04HHgHLdOGu9dq97lG/LnEP/mtg0p2qvQg/7pd1qkw6
         rGpw==
X-Gm-Message-State: AJIora9eAjT+ryIljVijED/6GWfWzQkbpCkviA5c8gmru/4uPlB1/ohB
	pXlyUJ0e8Fw2no8Cblt4YA9D1eVMspTSZPcu2TYhOg==
X-Google-Smtp-Source: AGRyM1slmSKT4oaRTvoiT+zqYKLRO8VZMcmvFZRHB+yMNqcOot+Bi/Gi/ENlDoj5HSWA21K7faXY/MuMJTnkM+UyxnQ=
X-Received: by 2002:a19:7902:0:b0:48a:6872:68ab with SMTP id
 u2-20020a197902000000b0048a687268abmr5632549lfc.626.1659373281536; Mon, 01
 Aug 2022 10:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207241857.Z2woeEfC-lkp@intel.com> <20220801164843.00006228@huawei.com>
In-Reply-To: <20220801164843.00006228@huawei.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 1 Aug 2022 10:01:09 -0700
Message-ID: <CAKwvOdkNXxXWCocBkNhb1EzR-QDm+BxuwGRgJ=d7VzWXLQsBKA@mail.gmail.com>
Subject: Re: [linux-next:master 2450/12552] drivers/iio/accel/sca3300.c:162:8:
 warning: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes,
 where 1 is optimal). Optimal fields order: name, scan_masks, channels,
 accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, f...
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Philip Li <philip.li@intel.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Tomas Melin <tomas.melin@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 1, 2022 at 8:49 AM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Sun, 24 Jul 2022 18:13:47 +0800
> kernel test robot <lkp@intel.com> wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   18c107a1f120d095404d141dfad8f594bdc44020
> > commit: 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53 [2450/12552] iio: acce=
l: sca3300: Add inclination channels
> > config: s390-randconfig-c005-20220721 (https://download.01.org/0day-ci/=
archive/20220724/202207241857.Z2woeEfC-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12=
fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install s390 cross compiling tool for clang build
> >         # apt-get install binutils-s390x-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3D38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
> >         # save the config file
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Ds390 clang-analyzer
>
> If there is any way to screen out the Excessive padding messages it would=
 be much appreciated.
> For the IIO structures that are producing a lot of these, the padding is =
entirely deliberate
> and required for correctness (DMA safety).
>
> Right now I'm directing all such warnings to the bin but they must be obs=
curing more useful
> warnings...

+ Philip
Philip might be able to set up a filter for these clang-tidy warnings
(clang-analyzer-optin.performance.Padding) on your part of the tree.
drivers/iio/accel/sca3300.c

Longer term, I wonder if we can add some clang-tidy flags to the Makefiles.=
..

>
> Thanks
>
>
> Jonathan
> >
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > clang-analyzer warnings: (new ones prefixed by >>)
> >                    for (tile =3D 0; tile < 8; tile++) {
> >                    ^
> >    drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is =
0
> >                            if (!fbdata->force && !picolcd_fb_update_til=
e(
> >                                ^~~~~~~~~~~~~~
> >    drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
> >    drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_updat=
e_tile'
> >                            if (!fbdata->force && !picolcd_fb_update_til=
e(
> >                                                   ^~~~~~~~~~~~~~~~~~~~~=
~~
> >    drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is equal to=
 1
> >            if (bpp =3D=3D 1) {
> >                ^~~~~~~~
> >    drivers/hid/hid-picolcd_fb.c:148:2: note: Taking true branch
> >            if (bpp =3D=3D 1) {
> >            ^
> >    drivers/hid/hid-picolcd_fb.c:149:3: note: Loop condition is true.  E=
ntering loop body
> >                    for (b =3D 7; b >=3D 0; b--) {
> >                    ^
> >    drivers/hid/hid-picolcd_fb.c:151:9: note: The value 0 is assigned to=
 'i'
> >                            for (i =3D 0; i < 64; i++) {
> >                                 ^~~~~
> >    drivers/hid/hid-picolcd_fb.c:151:4: note: Loop condition is true.  E=
ntering loop body
> >                            for (i =3D 0; i < 64; i++) {
> >                            ^
> >    drivers/hid/hid-picolcd_fb.c:152:14: note: The left expression of th=
e compound assignment is an uninitialized value. The computed value will al=
so be garbage
> >                                    tdata[i] <<=3D 1;
> >                                    ~~~~~~~~ ^
> >    drivers/hid/hid-picolcd_fb.c:160:14: warning: The left expression of=
 the compound assignment is an uninitialized value. The computed value will=
 also be garbage [clang-analyzer-core.uninitialized.Assign]
> >                                    tdata[i] <<=3D 1;
> >                                             ^
> >    drivers/hid/hid-picolcd_fb.c:438:2: note: Calling 'picolcd_fb_update=
'
> >            picolcd_fb_update(info);
> >            ^~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  =
Exiting loop
> >            spin_lock_irqsave(&fbdata->lock, flags);
> >            ^
> >    include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock=
_irqsave'
> >            raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
> >            ^
> >    include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_=
lock_irqsave'
> >            do {                                            \
> >            ^
> >    drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  =
Exiting loop
> >            spin_lock_irqsave(&fbdata->lock, flags);
> >            ^
> >    include/linux/spinlock.h:377:43: note: expanded from macro 'spin_loc=
k_irqsave'
> >    #define spin_lock_irqsave(lock, flags)                          \
> >                                                                    ^
> >    drivers/hid/hid-picolcd_fb.c:235:6: note: Assuming field 'ready' is =
not equal to 0
> >            if (!fbdata->ready && fbdata->picolcd)
> >                ^~~~~~~~~~~~~~
> >    drivers/hid/hid-picolcd_fb.c:235:21: note: Left side of '&&' is fals=
e
> >            if (!fbdata->ready && fbdata->picolcd)
> >                               ^
> >    drivers/hid/hid-picolcd_fb.c:247:2: note: Loop condition is true.  E=
ntering loop body
> >            for (chip =3D 0; chip < 4; chip++)
> >            ^
> >    drivers/hid/hid-picolcd_fb.c:248:3: note: Loop condition is true.  E=
ntering loop body
> >                    for (tile =3D 0; tile < 8; tile++) {
> >                    ^
> >    drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is =
0
> >                            if (!fbdata->force && !picolcd_fb_update_til=
e(
> >                                ^~~~~~~~~~~~~~
> >    drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
> >    drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_updat=
e_tile'
> >                            if (!fbdata->force && !picolcd_fb_update_til=
e(
> >                                                   ^~~~~~~~~~~~~~~~~~~~~=
~~
> >    drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is not equa=
l to 1
> >            if (bpp =3D=3D 1) {
> >                ^~~~~~~~
> >    drivers/hid/hid-picolcd_fb.c:148:2: note: Taking false branch
> >            if (bpp =3D=3D 1) {
> >            ^
> >    drivers/hid/hid-picolcd_fb.c:156:13: note: Assuming 'bpp' is equal t=
o 8
> >            } else if (bpp =3D=3D 8) {
> >                       ^~~~~~~~
> >    drivers/hid/hid-picolcd_fb.c:156:9: note: Taking true branch
> >            } else if (bpp =3D=3D 8) {
> >                   ^
> >    drivers/hid/hid-picolcd_fb.c:157:3: note: Loop condition is true.  E=
ntering loop body
> >                    for (b =3D 7; b >=3D 0; b--) {
> >                    ^
> >    drivers/hid/hid-picolcd_fb.c:159:9: note: The value 0 is assigned to=
 'i'
> >                            for (i =3D 0; i < 64; i++) {
> >                                 ^~~~~
> >    drivers/hid/hid-picolcd_fb.c:159:4: note: Loop condition is true.  E=
ntering loop body
> >                            for (i =3D 0; i < 64; i++) {
> >                            ^
> >    drivers/hid/hid-picolcd_fb.c:160:14: note: The left expression of th=
e compound assignment is an uninitialized value. The computed value will al=
so be garbage
> >                                    tdata[i] <<=3D 1;
> >                                    ~~~~~~~~ ^
> >    drivers/hid/hid-picolcd_fb.c:481:6: warning: Call to function 'sscan=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            i =3D sscanf(buf, "%u", &u);
> >                ^~~~~~
> >    drivers/hid/hid-picolcd_fb.c:481:6: note: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11
> >            i =3D sscanf(buf, "%u", &u);
> >                ^~~~~~
> >    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    24 warnings generated.
> > >> drivers/iio/accel/sca3300.c:162:8: warning: Excessive padding in 'st=
ruct sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fie=
lds order: name, scan_masks, channels, accel_scale, accel_scale_map, incli_=
scale, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channe=
ls, num_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id=
, angle_supported, consider reordering the fields or adding explicit paddin=
g members [clang-analyzer-optin.performance.Padding]
> >    struct sca3300_chip_info {
> >    ~~~~~~~^~~~~~~~~~~~~~~~~~~
> >    drivers/iio/accel/sca3300.c:162:8: note: Excessive padding in 'struc=
t sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fields=
 order: name, scan_masks, channels, accel_scale, accel_scale_map, incli_sca=
le, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channels,=
 num_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, a=
ngle_supported, consider reordering the fields or adding explicit padding m=
embers
> >    struct sca3300_chip_info {
> >    ~~~~~~~^~~~~~~~~~~~~~~~~~~
> >    drivers/iio/accel/sca3300.c:191:8: warning: Excessive padding in 'st=
ruct sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields=
 order: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields=
 or adding explicit padding members [clang-analyzer-optin.performance.Paddi=
ng]
> >    struct sca3300_data {
> >    ~~~~~~~^~~~~~~~~~~~~~
> >    drivers/iio/accel/sca3300.c:191:8: note: Excessive padding in 'struc=
t sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields or=
der: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields or=
 adding explicit padding members
> >    struct sca3300_data {
> >    ~~~~~~~^~~~~~~~~~~~~~
> >    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    22 warnings generated.
> >    Suppressed 22 warnings (9 in non-user code, 13 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    23 warnings generated.
> >    Suppressed 23 warnings (11 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    22 warnings generated.
> >    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    22 warnings generated.
> >    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    22 warnings generated.
> >    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    12 warnings generated.
> >    drivers/hwmon/emc6w201.c:186:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            return sprintf(buf, "%u\n",
> >                   ^~~~~~~
> >    drivers/hwmon/emc6w201.c:186:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
> >            return sprintf(buf, "%u\n",
> >                   ^~~~~~~
> >    drivers/hwmon/emc6w201.c:225:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
> >                   ^~~~~~~
> >    drivers/hwmon/emc6w201.c:225:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
> >            return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
> >                   ^~~~~~~
> >    drivers/hwmon/emc6w201.c:270:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            return sprintf(buf, "%u\n", rpm);
> >                   ^~~~~~~
> >    drivers/hwmon/emc6w201.c:270:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
> >            return sprintf(buf, "%u\n", rpm);
> >                   ^~~~~~~
> >    Suppressed 9 warnings (9 in non-user code).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    55 warnings generated.
> >    drivers/hwmon/f71882fg.c:1382:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            return sprintf(buf, "%d\n", speed);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1382:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
> >            return sprintf(buf, "%d\n", speed);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1391:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            return sprintf(buf, "%d\n", speed);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1391:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
> >            return sprintf(buf, "%d\n", speed);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1424:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >                    return sprintf(buf, "1\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1424:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
> >                    return sprintf(buf, "1\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1426:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >                    return sprintf(buf, "0\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1426:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
> >                    return sprintf(buf, "0\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1460:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >                    return sprintf(buf, "1\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1460:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
> >                    return sprintf(buf, "1\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1462:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >                    return sprintf(buf, "0\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1462:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
> >                    return sprintf(buf, "0\n");
> >                           ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1471:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            return sprintf(buf, "%d\n", data->in[nr] * 8);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1471:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
> >            return sprintf(buf, "%d\n", data->in[nr] * 8);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1479:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >            return sprintf(buf, "%d\n", data->in1_max * 8);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1479:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
> >            return sprintf(buf, "%d\n", data->in1_max * 8);
> >                   ^~~~~~~
> >    drivers/hwmon/f71882fg.c:1514:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >                    return sprintf(buf, "1\n");
> >
> > vim +162 drivers/iio/accel/sca3300.c
> >
> > 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  161
> > ad985d4d38d7ad LI Qingwu 2022-05-29 @162  struct sca3300_chip_info {
> > ad985d4d38d7ad LI Qingwu 2022-05-29  163      const char *name;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  164      const unsigned long *scan=
_masks;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  165      const struct iio_chan_spe=
c *channels;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  166      u8 num_channels;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  167      u8 num_accel_scales;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  168      const int (*accel_scale)[=
2];
> > ad985d4d38d7ad LI Qingwu 2022-05-29  169      const int *accel_scale_ma=
p;
> > 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  170      const int (*incli_scale)[=
2];
> > 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  171      const int *incli_scale_ma=
p;
> > 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  172      u8 num_incli_scales;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  173      u8 num_freqs;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  174      const int *freq_table;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  175      const int *freq_map;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  176      const int *avail_modes_ta=
ble;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  177      u8 num_avail_modes;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  178      u8 chip_id;
> > 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  179      bool angle_supported;
> > ad985d4d38d7ad LI Qingwu 2022-05-29  180  };
> > ad985d4d38d7ad LI Qingwu 2022-05-29  181
> >
> > :::::: The code at line 162 was first introduced by commit
> > :::::: ad985d4d38d7ad8a83b0ff428ea51a2f41ce12e1 iio: accel: sca3300: mo=
dified to support multi chips
> >
> > :::::: TO: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > :::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >
>
>


--=20
Thanks,
~Nick Desaulniers
