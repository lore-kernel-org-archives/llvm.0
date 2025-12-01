Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8B36D503;
	Mon,  1 Dec 2025 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764548472; cv=none; b=RRTQFHgyCCWIdeLmGywk+3AUevcPB4Bo2RYg7MaSuiS8PbK20hmxORkricT5G9bm7UA8UGtotqymMP6S7OcprpVa6IVx9+y4P3HMLPBansde0ZcfdYd0mzNs5i4gEt2Fky8MY+Hd4qvdFm7UN8m+Lsp0BDvH7cKRCx97js+J12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764548472; c=relaxed/simple;
	bh=jHDbS/DhOUdI5JgzKQCs7MPsGT1omweUENjGxWW0U18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VV1+pNP0+QNjgvrS4a3GJfLMKsK5GgyOHU1ZerDXIjI08Oi147xbwYad7yGJUeCJg3+gwSzgrz1D+JLqyymcDvwNbAefu/UFa45uS887JE+wmrh4l1KAatUITYdLFUDnhXUug4UU9pa8W5tMr5IXnTXBZI5QpOo6qMfSyJ3KNao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qJ5BEXpB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qJ5BEXpB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4Y9G9RxPG5fFEG7ynQzganUBYDTpDb+JbLE/05M4J1c=; b=qJ5BEXpBM/yIqEn4714paBvviz
	l8YvCsy4gAeHinUSNG3wt4836X0ZkK0HJcAFD2ggY4Be9IcSodWwBDQuIn1rXP5FzdMefiDrPdO1r
	El7giQTIlBKhDyhpSo869z1+4rD7gD8XHe2jYdFh3qf+/XEgquWqbdbRCA4Rm0VmM2jSUVwK25uqq
	9zK/uikmyjqCzxp09bmKgPrho4uocr7tM8eLK/FWF/UKPbD2w/Hpd1rFydMcdLVLMv0XfkS241Sdu
	sDKoRxgeuj2or7G5ngNk2cf73ddUGIEzlfb3MIL50b+glXD83RmnR14yOI2QVmKvlnx8esA2wWE7v
	LAJ9DttQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPrf2-00000002hXQ-0Dfz;
	Mon, 01 Dec 2025 00:21:00 +0000
Message-ID: <4d298cba-7e61-4933-a765-1f8a60b8f0f4@infradead.org>
Date: Sun, 30 Nov 2025 16:20:59 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lwn:docs-next 64/66] Warning:
 sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <202512010746.EPe9Xcp5-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202512010746.EPe9Xcp5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
Is the robot an AI?
Maybe that could help explain why a commit that fixes spelling,
grammar, punctuation, etc., causes all of these kernel-doc warnings--
all of which seem to be valid warning reports when I have a quick
look at them.


On 11/30/25 3:12 PM, kernel test robot wrote:
> tree:   git://git.lwn.net/linux.git docs-next
> head:   464257baf99200d1be1c053f15aa617056361e81
> commit: 5f88f44d8427a97347afda3a6114aed0df472a0b [64/66] docs: kdoc: various fixes for grammar, spelling, punctuation
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512010746.EPe9Xcp5-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: sound/usb/usx2y/us144mkii_controls.c:6 Cannot find identifier on line:
>     * @brief Text descriptions for playback output source options.
>    Warning: sound/usb/usx2y/us144mkii_controls.c:7 Cannot find identifier on line:
>     *
>>> Warning: sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>     * Used by ALSA kcontrol elements to provide user-friendly names for
>    Warning: sound/usb/usx2y/us144mkii_controls.c:15 Cannot find identifier on line:
>     * @brief Text descriptions for capture input source options.
>    Warning: sound/usb/usx2y/us144mkii_controls.c:16 Cannot find identifier on line:
>     *
>    Warning: sound/usb/usx2y/us144mkii_controls.c:17 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>     * Used by ALSA kcontrol elements to provide user-friendly names for
>    Warning: sound/usb/usx2y/us144mkii_controls.c:100 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_line_out_control ='
>    Warning: sound/usb/usx2y/us144mkii_controls.c:171 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_digital_out_control ='
>    Warning: sound/usb/usx2y/us144mkii_controls.c:259 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_12_control ='
>    Warning: sound/usb/usx2y/us144mkii_controls.c:330 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_34_control ='
>    Warning: sound/usb/usx2y/us144mkii_controls.c:408 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_samplerate_control ='
> --
>    Warning: sound/usb/usx2y/us144mkii.c:13 Cannot find identifier on line:
>     * @brief Module parameters for ALSA card instantiation.
>    Warning: sound/usb/usx2y/us144mkii.c:14 Cannot find identifier on line:
>     *
>>> Warning: sound/usb/usx2y/us144mkii.c:15 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>     * These parameters allow users to configure how the ALSA sound card
> --
>>> Warning: drivers/infiniband/hw/mlx5/umr.c:986 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>     * This function makes an mkey non-present by zapping the translation entries of
> 

-- 
~Randy

