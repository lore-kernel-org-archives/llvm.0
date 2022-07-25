Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD717E
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 01:48:09 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id w185so9151681pfb.4
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 18:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=tPwwpNDKWJIukmf6vmkDmyK4OoaGjaR7UxeO1IDVjc4=;
        b=pnOxJQREckItep4NWiBIrmPW9uS5X+Ke/pSt3clNvRIGxY5M79Ekzv/O7/hQqek0lZ
         vWTy+cUG7Oj4VXNZKGjlz3x8MiHu5jalSlNGx6fqT95bmrytFQGr6UtRWTELHSAY/DVT
         04JzOC5C66BquuzvYiG8sU2oUXCAL8unT+l3sHz+e4ibo5haoOLNAhF2o3Exp0NVDPDG
         Uv7YFuvbE+Kj0zffJQhNl1/6wyWLtzAAZxU9Cwqy5ovS/NpcNR6ayPVBYJPYv/3CXaT0
         NtbNVSEtqPgxaoM7cNLCslK5zJWv6ghmtyGPxwVegsK6h9oKacDL8JyFDgV4uvP8GZ0e
         b6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=tPwwpNDKWJIukmf6vmkDmyK4OoaGjaR7UxeO1IDVjc4=;
        b=FwW7X9o9Yj/ILTRkP6eMTiR28TlmG0Zbpgh0+QC2cWztPKcqtxoiVStE8pUbtKtocg
         BDyMky9u6GNsJvY7fK3T0UfEHwEEWx+XkOQ+AjGb1eOv6XVUNFDqrysugbr5GRTnRw5Q
         B6gj+QAgkyZPrVkP7B7HLfxBSDbPQFHnjRlXPcbIwE+g4/TEzgtAs8zf8P7D85rhw8m7
         FQomALWAdRnYDOSoj1xUcqbX2yZ/TEdSNKwf9or+SWPPnkEhKtP/3Nq6DxvUaR9IxKDW
         9DNLuAyeose0G5MwfpchLL2NC9QJJUnXKsE6o3DoHCIAeZEmLDqR07vzTknDMh327OXw
         5FuQ==
X-Gm-Message-State: AJIora/hH9dfheMMw9lYM0H+OPjvz0D9t7bgGaMnEB4jd+Dy2pZkf2OJ
	L/mljeMQvuLEu5Al01g2YeSkNKzbp0y0D41KqE4=
X-Google-Smtp-Source: AGRyM1u2/WDcs5vNGH8NpL+T46EgvO/M38R2EHzmJVeuHZHWENKtE12TWhkY6hwYLcVx/o5YV1SGUnitpNAJxJCIlHY=
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id
 b11-20020a056a000a8b00b004e152db9e5cmr10519056pfl.38.1658713688979; Sun, 24
 Jul 2022 18:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207241857.Z2woeEfC-lkp@intel.com>
In-Reply-To: <202207241857.Z2woeEfC-lkp@intel.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 25 Jul 2022 07:17:57 +0530
Message-ID: <CAFqt6zajXSzr6pJkBr=zC3UO8+xczvVkgDsHWoDgOTjx2XsFow@mail.gmail.com>
Subject: Re: [linux-next:master 2450/12552] drivers/iio/accel/sca3300.c:162:8:
 warning: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes,
 where 1 is optimal). Optimal fields order: name, scan_masks, channels,
 accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, f...
To: kernel test robot <lkp@intel.com>
Cc: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Tomas Melin <tomas.melin@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2022 at 3:44 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   18c107a1f120d095404d141dfad8f594bdc44020
> commit: 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53 [2450/12552] iio: accel:=
 sca3300: Add inclination channels
> config: s390-randconfig-c005-20220721 (https://download.01.org/0day-ci/ar=
chive/20220724/202207241857.Z2woeEfC-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fb=
d2d377e396ad61bce56d71c98a1eb1bebfa9)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
>         # save the config file
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Ds390 clang-analyzer
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> clang-analyzer warnings: (new ones prefixed by >>)
>                    for (tile =3D 0; tile < 8; tile++) {
>                    ^
>    drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
>                            if (!fbdata->force && !picolcd_fb_update_tile(
>                                ^~~~~~~~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
>    drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_=
tile'
>                            if (!fbdata->force && !picolcd_fb_update_tile(
>                                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is equal to 1
>            if (bpp =3D=3D 1) {
>                ^~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:148:2: note: Taking true branch
>            if (bpp =3D=3D 1) {
>            ^
>    drivers/hid/hid-picolcd_fb.c:149:3: note: Loop condition is true.  Ent=
ering loop body
>                    for (b =3D 7; b >=3D 0; b--) {
>                    ^
>    drivers/hid/hid-picolcd_fb.c:151:9: note: The value 0 is assigned to '=
i'
>                            for (i =3D 0; i < 64; i++) {
>                                 ^~~~~
>    drivers/hid/hid-picolcd_fb.c:151:4: note: Loop condition is true.  Ent=
ering loop body
>                            for (i =3D 0; i < 64; i++) {
>                            ^
>    drivers/hid/hid-picolcd_fb.c:152:14: note: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage
>                                    tdata[i] <<=3D 1;
>                                    ~~~~~~~~ ^
>    drivers/hid/hid-picolcd_fb.c:160:14: warning: The left expression of t=
he compound assignment is an uninitialized value. The computed value will a=
lso be garbage [clang-analyzer-core.uninitialized.Assign]
>                                    tdata[i] <<=3D 1;
>                                             ^
>    drivers/hid/hid-picolcd_fb.c:438:2: note: Calling 'picolcd_fb_update'
>            picolcd_fb_update(info);
>            ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Ex=
iting loop
>            spin_lock_irqsave(&fbdata->lock, flags);
>            ^
>    include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_i=
rqsave'
>            raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
>            ^
>    include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lo=
ck_irqsave'
>            do {                                            \
>            ^
>    drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Ex=
iting loop
>            spin_lock_irqsave(&fbdata->lock, flags);
>            ^
>    include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_=
irqsave'
>    #define spin_lock_irqsave(lock, flags)                          \
>                                                                    ^
>    drivers/hid/hid-picolcd_fb.c:235:6: note: Assuming field 'ready' is no=
t equal to 0
>            if (!fbdata->ready && fbdata->picolcd)
>                ^~~~~~~~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:235:21: note: Left side of '&&' is false
>            if (!fbdata->ready && fbdata->picolcd)
>                               ^
>    drivers/hid/hid-picolcd_fb.c:247:2: note: Loop condition is true.  Ent=
ering loop body
>            for (chip =3D 0; chip < 4; chip++)
>            ^
>    drivers/hid/hid-picolcd_fb.c:248:3: note: Loop condition is true.  Ent=
ering loop body
>                    for (tile =3D 0; tile < 8; tile++) {
>                    ^
>    drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
>                            if (!fbdata->force && !picolcd_fb_update_tile(
>                                ^~~~~~~~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
>    drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_=
tile'
>                            if (!fbdata->force && !picolcd_fb_update_tile(
>                                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is not equal =
to 1
>            if (bpp =3D=3D 1) {
>                ^~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:148:2: note: Taking false branch
>            if (bpp =3D=3D 1) {
>            ^
>    drivers/hid/hid-picolcd_fb.c:156:13: note: Assuming 'bpp' is equal to =
8
>            } else if (bpp =3D=3D 8) {
>                       ^~~~~~~~
>    drivers/hid/hid-picolcd_fb.c:156:9: note: Taking true branch
>            } else if (bpp =3D=3D 8) {
>                   ^
>    drivers/hid/hid-picolcd_fb.c:157:3: note: Loop condition is true.  Ent=
ering loop body
>                    for (b =3D 7; b >=3D 0; b--) {
>                    ^
>    drivers/hid/hid-picolcd_fb.c:159:9: note: The value 0 is assigned to '=
i'
>                            for (i =3D 0; i < 64; i++) {
>                                 ^~~~~
>    drivers/hid/hid-picolcd_fb.c:159:4: note: Loop condition is true.  Ent=
ering loop body
>                            for (i =3D 0; i < 64; i++) {
>                            ^
>    drivers/hid/hid-picolcd_fb.c:160:14: note: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage
>                                    tdata[i] <<=3D 1;
>                                    ~~~~~~~~ ^


u8 tdata[64] in picolcd_fb_update_tile() needs to be initialized.
What should be the initialized value ?


>    drivers/hid/hid-picolcd_fb.c:481:6: warning: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            i =3D sscanf(buf, "%u", &u);
>                ^~~~~~
>    drivers/hid/hid-picolcd_fb.c:481:6: note: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11
>            i =3D sscanf(buf, "%u", &u);
>                ^~~~~~
>    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    24 warnings generated.
> >> drivers/iio/accel/sca3300.c:162:8: warning: Excessive padding in 'stru=
ct sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal field=
s order: name, scan_masks, channels, accel_scale, accel_scale_map, incli_sc=
ale, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channels=
, num_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, =
angle_supported, consider reordering the fields or adding explicit padding =
members [clang-analyzer-optin.performance.Padding]
>    struct sca3300_chip_info {
>    ~~~~~~~^~~~~~~~~~~~~~~~~~~
>    drivers/iio/accel/sca3300.c:162:8: note: Excessive padding in 'struct =
sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fields o=
rder: name, scan_masks, channels, accel_scale, accel_scale_map, incli_scale=
, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channels, n=
um_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, ang=
le_supported, consider reordering the fields or adding explicit padding mem=
bers
>    struct sca3300_chip_info {
>    ~~~~~~~^~~~~~~~~~~~~~~~~~~
>    drivers/iio/accel/sca3300.c:191:8: warning: Excessive padding in 'stru=
ct sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields o=
rder: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields o=
r adding explicit padding members [clang-analyzer-optin.performance.Padding=
]
>    struct sca3300_data {
>    ~~~~~~~^~~~~~~~~~~~~~
>    drivers/iio/accel/sca3300.c:191:8: note: Excessive padding in 'struct =
sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields orde=
r: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields or a=
dding explicit padding members
>    struct sca3300_data {
>    ~~~~~~~^~~~~~~~~~~~~~
>    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    22 warnings generated.
>    Suppressed 22 warnings (9 in non-user code, 13 with check filters).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    23 warnings generated.
>    Suppressed 23 warnings (11 in non-user code, 12 with check filters).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    22 warnings generated.
>    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    22 warnings generated.
>    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    22 warnings generated.
>    Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    12 warnings generated.
>    drivers/hwmon/emc6w201.c:186:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            return sprintf(buf, "%u\n",
>                   ^~~~~~~
>    drivers/hwmon/emc6w201.c:186:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
>            return sprintf(buf, "%u\n",
>                   ^~~~~~~
>    drivers/hwmon/emc6w201.c:225:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
>                   ^~~~~~~
>    drivers/hwmon/emc6w201.c:225:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
>            return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
>                   ^~~~~~~
>    drivers/hwmon/emc6w201.c:270:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            return sprintf(buf, "%u\n", rpm);
>                   ^~~~~~~
>    drivers/hwmon/emc6w201.c:270:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
>            return sprintf(buf, "%u\n", rpm);
>                   ^~~~~~~
>    Suppressed 9 warnings (9 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    55 warnings generated.
>    drivers/hwmon/f71882fg.c:1382:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            return sprintf(buf, "%d\n", speed);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1382:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
>            return sprintf(buf, "%d\n", speed);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1391:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            return sprintf(buf, "%d\n", speed);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1391:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
>            return sprintf(buf, "%d\n", speed);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1424:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>                    return sprintf(buf, "1\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1424:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
>                    return sprintf(buf, "1\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1426:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>                    return sprintf(buf, "0\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1426:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
>                    return sprintf(buf, "0\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1460:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>                    return sprintf(buf, "1\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1460:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
>                    return sprintf(buf, "1\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1462:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>                    return sprintf(buf, "0\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1462:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
>                    return sprintf(buf, "0\n");
>                           ^~~~~~~
>    drivers/hwmon/f71882fg.c:1471:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            return sprintf(buf, "%d\n", data->in[nr] * 8);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1471:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
>            return sprintf(buf, "%d\n", data->in[nr] * 8);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1479:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>            return sprintf(buf, "%d\n", data->in1_max * 8);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1479:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
>            return sprintf(buf, "%d\n", data->in1_max * 8);
>                   ^~~~~~~
>    drivers/hwmon/f71882fg.c:1514:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>                    return sprintf(buf, "1\n");
>
> vim +162 drivers/iio/accel/sca3300.c
>
> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  161
> ad985d4d38d7ad LI Qingwu 2022-05-29 @162  struct sca3300_chip_info {
> ad985d4d38d7ad LI Qingwu 2022-05-29  163        const char *name;
> ad985d4d38d7ad LI Qingwu 2022-05-29  164        const unsigned long *scan=
_masks;
> ad985d4d38d7ad LI Qingwu 2022-05-29  165        const struct iio_chan_spe=
c *channels;
> ad985d4d38d7ad LI Qingwu 2022-05-29  166        u8 num_channels;
> ad985d4d38d7ad LI Qingwu 2022-05-29  167        u8 num_accel_scales;
> ad985d4d38d7ad LI Qingwu 2022-05-29  168        const int (*accel_scale)[=
2];
> ad985d4d38d7ad LI Qingwu 2022-05-29  169        const int *accel_scale_ma=
p;
> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  170        const int (*incli_scale)[=
2];
> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  171        const int *incli_scale_ma=
p;
> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  172        u8 num_incli_scales;
> ad985d4d38d7ad LI Qingwu 2022-05-29  173        u8 num_freqs;
> ad985d4d38d7ad LI Qingwu 2022-05-29  174        const int *freq_table;
> ad985d4d38d7ad LI Qingwu 2022-05-29  175        const int *freq_map;
> ad985d4d38d7ad LI Qingwu 2022-05-29  176        const int *avail_modes_ta=
ble;
> ad985d4d38d7ad LI Qingwu 2022-05-29  177        u8 num_avail_modes;
> ad985d4d38d7ad LI Qingwu 2022-05-29  178        u8 chip_id;
> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  179        bool angle_supported;
> ad985d4d38d7ad LI Qingwu 2022-05-29  180  };
> ad985d4d38d7ad LI Qingwu 2022-05-29  181
>
> :::::: The code at line 162 was first introduced by commit
> :::::: ad985d4d38d7ad8a83b0ff428ea51a2f41ce12e1 iio: accel: sca3300: modi=
fied to support multi chips
>
> :::::: TO: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> :::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>
