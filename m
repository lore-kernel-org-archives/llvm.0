Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693422C9C;
	Thu, 13 Apr 2023 11:00:35 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PxxPh5dddz6J7Lm;
	Thu, 13 Apr 2023 18:58:00 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Apr
 2023 12:00:25 +0100
Date: Thu, 13 Apr 2023 12:00:24 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Patrik =?ISO-8859-1?Q?Dahlstr=F6m?= <risca@dalakolonin.se>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [jic23-iio:testing 9/10] drivers/iio/adc/palmas_gpadc.c:753:7:
 warning: variable 'old' is used uninitialized whenever 'if' condition is
 true
Message-ID: <20230413120024.00006ac1@Huawei.com>
In-Reply-To: <202304130711.Eueav3k7-lkp@intel.com>
References: <202304130711.Eueav3k7-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected

On Thu, 13 Apr 2023 07:56:53 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   32f442dba193b5682bd1e9784b0ea42893c6e966
> commit: 78441f504e3991b3f33b48de6fc8ed3cba7a40a7 [9/10] iio: adc: palmas: add support for iio threshold events
> config: i386-randconfig-a002-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130711.Eueav3k7-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=78441f504e3991b3f33b48de6fc8ed3cba7a40a7
>         git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
>         git fetch --no-tags jic23-iio testing
>         git checkout 78441f504e3991b3f33b48de6fc8ed3cba7a40a7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iio/adc/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304130711.Eueav3k7-lkp@intel.com/
Fixed up.

Thanks,

Jonathan

> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/iio/adc/palmas_gpadc.c:753:7: warning: variable 'old' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]  
>                    if (val < 0 || val > 0xFFF) {
>                        ^~~~~~~~~~~~~~~~~~~~~~
>    drivers/iio/adc/palmas_gpadc.c:772:13: note: uninitialized use occurs here
>            if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
>                       ^~~
>    drivers/iio/adc/palmas_gpadc.c:753:3: note: remove the 'if' if its condition is always false
>                    if (val < 0 || val > 0xFFF) {
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/iio/adc/palmas_gpadc.c:753:7: warning: variable 'old' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]  
>                    if (val < 0 || val > 0xFFF) {
>                        ^~~~~~~
>    drivers/iio/adc/palmas_gpadc.c:772:13: note: uninitialized use occurs here
>            if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
>                       ^~~
>    drivers/iio/adc/palmas_gpadc.c:753:7: note: remove the '||' if its condition is always false
>                    if (val < 0 || val > 0xFFF) {
>                        ^~~~~~~~~~
>    drivers/iio/adc/palmas_gpadc.c:744:9: note: initialize the variable 'old' to silence this warning
>            int old;
>                   ^
>                    = 0
>    2 warnings generated.
> 
> 
> vim +753 drivers/iio/adc/palmas_gpadc.c
> 
>    734	
>    735	static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
>    736						  const struct iio_chan_spec *chan,
>    737						  enum iio_event_type type,
>    738						  enum iio_event_direction dir,
>    739						  enum iio_event_info info,
>    740						  int val, int val2)
>    741	{
>    742		struct palmas_gpadc *adc = iio_priv(indio_dev);
>    743		int adc_chan = chan->channel;
>    744		int old;
>    745		int ret;
>    746	
>    747		if (adc_chan > PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
>    748			return -EINVAL;
>    749	
>    750		mutex_lock(&adc->lock);
>    751		switch (info) {
>    752		case IIO_EV_INFO_VALUE:
>  > 753			if (val < 0 || val > 0xFFF) {  
>    754				ret = -EINVAL;
replaced with

goto out_unlock;

>    755				break;
>    756			}
>    757			if (dir == IIO_EV_DIR_RISING) {
>    758				old = adc->thresholds[adc_chan].high;
>    759				adc->thresholds[adc_chan].high = val;
>    760			}
>    761			else {
>    762				old = adc->thresholds[adc_chan].low;
>    763				adc->thresholds[adc_chan].low = val;
>    764			}
>    765			ret = 0;
>    766			break;
>    767		default:
>    768			ret = -EINVAL;
>    769			goto out_unlock;
>    770		}
>    771	
>    772		if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
>    773			ret = palmas_gpadc_reconfigure_event_channels(adc);
>    774	
>    775	out_unlock:
>    776		mutex_unlock(&adc->lock);
>    777	
>    778		return ret;
>    779	}
>    780	
> 

