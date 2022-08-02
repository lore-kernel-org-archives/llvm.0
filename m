Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255627F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659431049; x=1690967049;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=PMF11bGx509vldiUWAI9vXrBSnno+o/CVFoQmz3jtDo=;
  b=MrpTcsxvaGF0YA6Q147ea2SE61VDoL1bXdJ9Ec732C9AhI3iRKujN5Oe
   QLy1keyVtkjxS/3jOBXHjTXOJ8D+oTXTup0e5WbxbU+6zZdRKZ4YZTkB/
   RGXNUtI7IewLXO0WJTIPUAzoDhaMI/9fejvKAtZFGVwgPaH0+EddTWDOd
   AVtJi6++LYd2dDIvLAEgT0zgWwc+XTxUlpzfbJLlhYcxNoOo1hkA97t0i
   yrtBFNX/fwmW/zNyDVu+G5NKo71hb2jl47B0u2MbjU0AeEPRUrO8L0IYU
   MDKq/f0A6NdKJFo3/JaF8VmsVhnVFzcY445OtGbZpuG15vm1zSpZqPKwn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="353365803"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="353365803"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 02:04:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="661542492"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.168.243]) ([10.249.168.243])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 02:04:03 -0700
Subject: Re: [linux-next:master 2450/12552] drivers/iio/accel/sca3300.c:162:8:
 warning: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes,
 where 1 is optimal). Optimal fields order: name, scan_masks, channels,
 accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, f...
To: Nick Desaulniers <ndesaulniers@google.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Philip Li <philip.li@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 Tomas Melin <tomas.melin@vaisala.com>
References: <202207241857.Z2woeEfC-lkp@intel.com>
 <20220801164843.00006228@huawei.com>
 <CAKwvOdkNXxXWCocBkNhb1EzR-QDm+BxuwGRgJ=d7VzWXLQsBKA@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <8aa31c28-bf97-e791-a053-21ba5af69069@intel.com>
Date: Tue, 2 Aug 2022 17:04:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkNXxXWCocBkNhb1EzR-QDm+BxuwGRgJ=d7VzWXLQsBKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/2/2022 1:01 AM, Nick Desaulniers wrote:
> On Mon, Aug 1, 2022 at 8:49 AM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
>>
>> On Sun, 24 Jul 2022 18:13:47 +0800
>> kernel test robot <lkp@intel.com> wrote:
>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   18c107a1f120d095404d141dfad8f594bdc44020
>>> commit: 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53 [2450/12552] iio: accel: sca3300: Add inclination channels
>>> config: s390-randconfig-c005-20220721 (https://download.01.org/0day-ci/archive/20220724/202207241857.Z2woeEfC-lkp@intel.com/config)
>>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
>>> reproduce (this is a W=1 build):
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # install s390 cross compiling tool for clang build
>>>          # apt-get install binutils-s390x-linux-gnu
>>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
>>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>>          git fetch --no-tags linux-next master
>>>          git checkout 38d5cd1e7ee0b3e96f39ed3a93cada1c71352c53
>>>          # save the config file
>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer
>>
>> If there is any way to screen out the Excessive padding messages it would be much appreciated.
>> For the IIO structures that are producing a lot of these, the padding is entirely deliberate
>> and required for correctness (DMA safety).
>>
>> Right now I'm directing all such warnings to the bin but they must be obscuring more useful
>> warnings...
> 
> + Philip
> Philip might be able to set up a filter for these clang-tidy warnings
> (clang-analyzer-optin.performance.Padding) on your part of the tree.
> drivers/iio/accel/sca3300.c

Hi Nick, Jonathan,

Sorry for the inconvenience, we have added the warnings to ignore list.

Best Regards,
Rong Chen


> 
> Longer term, I wonder if we can add some clang-tidy flags to the Makefiles...
> 
>>
>> Thanks
>>
>>
>> Jonathan
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> clang-analyzer warnings: (new ones prefixed by >>)
>>>                     for (tile = 0; tile < 8; tile++) {
>>>                     ^
>>>     drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
>>>                             if (!fbdata->force && !picolcd_fb_update_tile(
>>>                                 ^~~~~~~~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
>>>     drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_tile'
>>>                             if (!fbdata->force && !picolcd_fb_update_tile(
>>>                                                    ^~~~~~~~~~~~~~~~~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is equal to 1
>>>             if (bpp == 1) {
>>>                 ^~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:148:2: note: Taking true branch
>>>             if (bpp == 1) {
>>>             ^
>>>     drivers/hid/hid-picolcd_fb.c:149:3: note: Loop condition is true.  Entering loop body
>>>                     for (b = 7; b >= 0; b--) {
>>>                     ^
>>>     drivers/hid/hid-picolcd_fb.c:151:9: note: The value 0 is assigned to 'i'
>>>                             for (i = 0; i < 64; i++) {
>>>                                  ^~~~~
>>>     drivers/hid/hid-picolcd_fb.c:151:4: note: Loop condition is true.  Entering loop body
>>>                             for (i = 0; i < 64; i++) {
>>>                             ^
>>>     drivers/hid/hid-picolcd_fb.c:152:14: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
>>>                                     tdata[i] <<= 1;
>>>                                     ~~~~~~~~ ^
>>>     drivers/hid/hid-picolcd_fb.c:160:14: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
>>>                                     tdata[i] <<= 1;
>>>                                              ^
>>>     drivers/hid/hid-picolcd_fb.c:438:2: note: Calling 'picolcd_fb_update'
>>>             picolcd_fb_update(info);
>>>             ^~~~~~~~~~~~~~~~~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exiting loop
>>>             spin_lock_irqsave(&fbdata->lock, flags);
>>>             ^
>>>     include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irqsave'
>>>             raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
>>>             ^
>>>     include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock_irqsave'
>>>             do {                                            \
>>>             ^
>>>     drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exiting loop
>>>             spin_lock_irqsave(&fbdata->lock, flags);
>>>             ^
>>>     include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_irqsave'
>>>     #define spin_lock_irqsave(lock, flags)                          \
>>>                                                                     ^
>>>     drivers/hid/hid-picolcd_fb.c:235:6: note: Assuming field 'ready' is not equal to 0
>>>             if (!fbdata->ready && fbdata->picolcd)
>>>                 ^~~~~~~~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:235:21: note: Left side of '&&' is false
>>>             if (!fbdata->ready && fbdata->picolcd)
>>>                                ^
>>>     drivers/hid/hid-picolcd_fb.c:247:2: note: Loop condition is true.  Entering loop body
>>>             for (chip = 0; chip < 4; chip++)
>>>             ^
>>>     drivers/hid/hid-picolcd_fb.c:248:3: note: Loop condition is true.  Entering loop body
>>>                     for (tile = 0; tile < 8; tile++) {
>>>                     ^
>>>     drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
>>>                             if (!fbdata->force && !picolcd_fb_update_tile(
>>>                                 ^~~~~~~~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
>>>     drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_tile'
>>>                             if (!fbdata->force && !picolcd_fb_update_tile(
>>>                                                    ^~~~~~~~~~~~~~~~~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is not equal to 1
>>>             if (bpp == 1) {
>>>                 ^~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:148:2: note: Taking false branch
>>>             if (bpp == 1) {
>>>             ^
>>>     drivers/hid/hid-picolcd_fb.c:156:13: note: Assuming 'bpp' is equal to 8
>>>             } else if (bpp == 8) {
>>>                        ^~~~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:156:9: note: Taking true branch
>>>             } else if (bpp == 8) {
>>>                    ^
>>>     drivers/hid/hid-picolcd_fb.c:157:3: note: Loop condition is true.  Entering loop body
>>>                     for (b = 7; b >= 0; b--) {
>>>                     ^
>>>     drivers/hid/hid-picolcd_fb.c:159:9: note: The value 0 is assigned to 'i'
>>>                             for (i = 0; i < 64; i++) {
>>>                                  ^~~~~
>>>     drivers/hid/hid-picolcd_fb.c:159:4: note: Loop condition is true.  Entering loop body
>>>                             for (i = 0; i < 64; i++) {
>>>                             ^
>>>     drivers/hid/hid-picolcd_fb.c:160:14: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
>>>                                     tdata[i] <<= 1;
>>>                                     ~~~~~~~~ ^
>>>     drivers/hid/hid-picolcd_fb.c:481:6: warning: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             i = sscanf(buf, "%u", &u);
>>>                 ^~~~~~
>>>     drivers/hid/hid-picolcd_fb.c:481:6: note: Call to function 'sscanf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11
>>>             i = sscanf(buf, "%u", &u);
>>>                 ^~~~~~
>>>     Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     24 warnings generated.
>>>>> drivers/iio/accel/sca3300.c:162:8: warning: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fields order: name, scan_masks, channels, accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channels, num_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, angle_supported, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
>>>     struct sca3300_chip_info {
>>>     ~~~~~~~^~~~~~~~~~~~~~~~~~~
>>>     drivers/iio/accel/sca3300.c:162:8: note: Excessive padding in 'struct sca3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fields order: name, scan_masks, channels, accel_scale, accel_scale_map, incli_scale, incli_scale_map, freq_table, freq_map, avail_modes_table, num_channels, num_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, angle_supported, consider reordering the fields or adding explicit padding members
>>>     struct sca3300_chip_info {
>>>     ~~~~~~~^~~~~~~~~~~~~~~~~~~
>>>     drivers/iio/accel/sca3300.c:191:8: warning: Excessive padding in 'struct sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields order: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
>>>     struct sca3300_data {
>>>     ~~~~~~~^~~~~~~~~~~~~~
>>>     drivers/iio/accel/sca3300.c:191:8: note: Excessive padding in 'struct sca3300_data' (328 padding bytes, where 72 is optimal). Optimal fields order: txbuf, rxbuf, spi, chip, scan, lock, consider reordering the fields or adding explicit padding members
>>>     struct sca3300_data {
>>>     ~~~~~~~^~~~~~~~~~~~~~
>>>     Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     22 warnings generated.
>>>     Suppressed 22 warnings (9 in non-user code, 13 with check filters).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     23 warnings generated.
>>>     Suppressed 23 warnings (11 in non-user code, 12 with check filters).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     22 warnings generated.
>>>     Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     22 warnings generated.
>>>     Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     22 warnings generated.
>>>     Suppressed 22 warnings (10 in non-user code, 12 with check filters).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     12 warnings generated.
>>>     drivers/hwmon/emc6w201.c:186:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             return sprintf(buf, "%u\n",
>>>                    ^~~~~~~
>>>     drivers/hwmon/emc6w201.c:186:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>             return sprintf(buf, "%u\n",
>>>                    ^~~~~~~
>>>     drivers/hwmon/emc6w201.c:225:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
>>>                    ^~~~~~~
>>>     drivers/hwmon/emc6w201.c:225:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>             return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
>>>                    ^~~~~~~
>>>     drivers/hwmon/emc6w201.c:270:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             return sprintf(buf, "%u\n", rpm);
>>>                    ^~~~~~~
>>>     drivers/hwmon/emc6w201.c:270:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>             return sprintf(buf, "%u\n", rpm);
>>>                    ^~~~~~~
>>>     Suppressed 9 warnings (9 in non-user code).
>>>     Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>>>     55 warnings generated.
>>>     drivers/hwmon/f71882fg.c:1382:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             return sprintf(buf, "%d\n", speed);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1382:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>             return sprintf(buf, "%d\n", speed);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1391:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             return sprintf(buf, "%d\n", speed);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1391:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>             return sprintf(buf, "%d\n", speed);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1424:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>                     return sprintf(buf, "1\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1424:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>                     return sprintf(buf, "1\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1426:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>                     return sprintf(buf, "0\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1426:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>                     return sprintf(buf, "0\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1460:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>                     return sprintf(buf, "1\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1460:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>                     return sprintf(buf, "1\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1462:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>                     return sprintf(buf, "0\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1462:10: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>                     return sprintf(buf, "0\n");
>>>                            ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1471:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             return sprintf(buf, "%d\n", data->in[nr] * 8);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1471:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>             return sprintf(buf, "%d\n", data->in[nr] * 8);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1479:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>             return sprintf(buf, "%d\n", data->in1_max * 8);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1479:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
>>>             return sprintf(buf, "%d\n", data->in1_max * 8);
>>>                    ^~~~~~~
>>>     drivers/hwmon/f71882fg.c:1514:10: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>>>                     return sprintf(buf, "1\n");
>>>
>>> vim +162 drivers/iio/accel/sca3300.c
>>>
>>> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  161
>>> ad985d4d38d7ad LI Qingwu 2022-05-29 @162  struct sca3300_chip_info {
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  163      const char *name;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  164      const unsigned long *scan_masks;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  165      const struct iio_chan_spec *channels;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  166      u8 num_channels;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  167      u8 num_accel_scales;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  168      const int (*accel_scale)[2];
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  169      const int *accel_scale_map;
>>> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  170      const int (*incli_scale)[2];
>>> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  171      const int *incli_scale_map;
>>> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  172      u8 num_incli_scales;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  173      u8 num_freqs;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  174      const int *freq_table;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  175      const int *freq_map;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  176      const int *avail_modes_table;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  177      u8 num_avail_modes;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  178      u8 chip_id;
>>> 38d5cd1e7ee0b3 LI Qingwu 2022-05-29  179      bool angle_supported;
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  180  };
>>> ad985d4d38d7ad LI Qingwu 2022-05-29  181
>>>
>>> :::::: The code at line 162 was first introduced by commit
>>> :::::: ad985d4d38d7ad8a83b0ff428ea51a2f41ce12e1 iio: accel: sca3300: modified to support multi chips
>>>
>>> :::::: TO: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
>>> :::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>
>>
>>
> 
> 
