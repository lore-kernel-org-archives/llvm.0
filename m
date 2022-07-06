Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0D4A3E
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 12:45:34 +0000 (UTC)
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LdK2C1C13z6H7nW;
	Wed,  6 Jul 2022 20:42:43 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 6 Jul 2022 14:45:25 +0200
Received: from localhost (10.206.134.24) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Jul
 2022 13:45:24 +0100
Date: Wed, 6 Jul 2022 13:45:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
	<linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: drivers/iio/adc/ad7476.c:29:8: warning: Excessive padding in
 'struct ad7476_chip_info' (10 padding bytes, where 2 is optimal). Optimal
 fields order: reset, channel, convst_channel, int_vref_uv, has_vref,
 has_vdrive, consider reordering the fields or addin...
Message-ID: <20220706134523.00000555@Huawei.com>
In-Reply-To: <202207060054.o8GrfMhS-lkp@intel.com>
References: <202207060054.o8GrfMhS-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.206.134.24]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected



>    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>    21 warnings generated.
> >> drivers/iio/adc/ad7476.c:29:8: warning: Excessive padding in 'struct ad7476_chip_info' (10 padding bytes, where 2 is optimal). Optimal fields order: reset, channel, convst_channel, int_vref_uv, has_vref, has_vdrive, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]  
>    struct ad7476_chip_info {
>    ~~~~~~~^~~~~~~~~~~~~~~~~~
>    drivers/iio/adc/ad7476.c:29:8: note: Excessive padding in 'struct ad7476_chip_info' (10 padding bytes, where 2 is optimal). Optimal fields order: reset, channel, convst_channel, int_vref_uv, has_vref, has_vdrive, consider reordering the fields or adding explicit padding members
>    struct ad7476_chip_info {
>    ~~~~~~~^~~~~~~~~~~~~~~~~~
> >> drivers/iio/adc/ad7476.c:39:8: warning: Excessive padding in 'struct ad7476_state' (472 padding bytes, where 216 is optimal). Optimal fields order: data, spi, chip_info, ref_reg, convst_gpio, msg, xfer, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]  
>    struct ad7476_state {

For this one and I'm guessing some of the other IIO cases, if there is any way to suppress the warning where we have specific
alignments specified then that would be great. These are padded to ensure the buffers are DMA safe.

Thanks,

Jonathan


>    ~~~~~~~^~~~~~~~~~~~~~
>    drivers/iio/adc/ad7476.c:39:8: note: Excessive padding in 'struct ad7476_state' (472 padding bytes, where 216 is optimal). Optimal fields order: data, spi, chip_info, ref_reg, convst_gpio, msg, xfer, consider reordering the fields or adding explicit padding members
>    struct ad7476_state {
>    ~~~~~~~^~~~~~~~~~~~~~
>    Suppressed 19 warnings (7 in non-user code, 12 with check filters).
>    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>    20 warnings generated.
>    drivers/iio/adc/ad7766.c:35:8: warning: Excessive padding in 'struct ad7766' (392 padding bytes, where 136 is optimal). Optimal fields order: data, chip_info, spi, mclk, pd_gpio, trig, reg, msg, xfer, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
>    struct ad7766 {
>    ~~~~~~~^~~~~~~~
>    drivers/iio/adc/ad7766.c:35:8: note: Excessive padding in 'struct ad7766' (392 padding bytes, where 136 is optimal). Optimal fields order: data, chip_info, spi, mclk, pd_gpio, trig, reg, msg, xfer, consider reordering the fields or adding explicit padding members
>    struct ad7766 {
>    ~~~~~~~^~~~~~~~
>    Suppressed 19 warnings (7 in non-user code, 12 with check filters).
>    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>    20 warnings generated.
>    drivers/iio/adc/ad7768-1.c:154:8: warning: Excessive padding in 'struct ad7768_state' (388 padding bytes, where 132 is optimal). Optimal fields order: data, mclk_freq, spi, vref, mclk, trig, gpio_sync_in, labels, lock, completion, samp_freq, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
>    struct ad7768_state {
>    ~~~~~~~^~~~~~~~~~~~~~
>    drivers/iio/adc/ad7768-1.c:154:8: note: Excessive padding in 'struct ad7768_state' (388 padding bytes, where 132 is optimal). Optimal fields order: data, mclk_freq, spi, vref, mclk, trig, gpio_sync_in, labels, lock, completion, samp_freq, consider reordering the fields or adding explicit padding members
>    struct ad7768_state {
>    ~~~~~~~^~~~~~~~~~~~~~
