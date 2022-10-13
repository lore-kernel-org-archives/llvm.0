Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4543920E3
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 06:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665641687; x=1697177687;
  h=message-id:date:mime-version:subject:cc:references:from:
   to:in-reply-to:content-transfer-encoding;
  bh=zJgjNEVAuYaGMQ6lYH0Bn1yiH1iSfy1pag8xbODnifE=;
  b=FxGkQpJyN/LUQjRtJVysN4u0uSVhPu/s/gE2fXklIIXEyW+TSSHg7yUg
   6MO0qD5gSNjaIPP9tA5JT0M2px8X4njiR0rfwZX9X3ny97f788BwazMjS
   nNCiyuTPh/9TXOfXKZXwlPQQG8pO/HI2sy9DqUKTMQKPqdpQd6srmQoVs
   j5TqJpOMAyaZqut28U7xAATvQlbAjrvHif4swvEGj0xUINCy/wY7ESZ4B
   170eu0Vqpp/mj9VpO1I8A2YZCSTKiDTZNxxzvUaqD42f3pijTiYT+EfeJ
   O578n3dpAJJUhT/ox6G6qvVKm0kfy40uU8cxVLJwtVYUz/0WTyoVnINeS
   A==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; 
   d="scan'208";a="325773971"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 14:13:38 +0800
IronPort-SDR: XCULuE1fEsVZ5yLXY94mnhmMEcXZjv5leRRwgi/wKks1iJE9kLJc4v/qSR59Ola0v4FxFzsFVc
 Fo1571sjBZy3u0lm+MDMvj2WEN0KMeY31HeMpX8YxrtpP0rBC8NYi2GOoyXUn0d/2NKKlnCjeK
 wy7Vh9f0qipUXdy1PpMOhL3ZGJWpG5W5h2ZUecb9yCnHlfZT7B0+Pj4qIvKm2igt4pLISwKTFb
 NR+Rw8SarfxMa7oyiPPHVN3ajYiE9AUDW1bEi85WkGMYx4Xtna1ZaUQ19Qojb02PCvdxIAUTlS
 4TQPpiG+DjhRbxfNZq3MPIke
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Oct 2022 22:33:15 -0700
IronPort-SDR: 8NdGmX7wzFwhHXWC9bIikY/ltPIojH76Z/uMsBfymDu2O97NVgmAW3ZTtbZO4b+7DVF9exfxK7
 8ZzD7ByTqCZgMQwpjn5wIQ2k0thRlDsIFBbGyxV/k17BLUvvpL2aDpwGAYOK0QnP21zyCbD1br
 G6TxH3OO/jgf92/KRoVXf/MsvswBTILX6BMEygbJMksqn35Br9heVstsC3Kk36MHRB6M2Wx7S9
 6ypnaym5IBSX20hOr4CWHbOaDpH8uvUSUWyiz9YZH0fHk2sfSw7B6EE6ULH5wiCQ7Ui/jIOpDl
 47Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Oct 2022 23:13:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MnzjY1ffsz1RvTr
	for <llvm@lists.linux.dev>; Wed, 12 Oct 2022 23:13:37 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:to:organization:from:references:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1665641616; x=1668233617; bh=zJgjNEVAuYaGMQ6lYH0Bn1yiH1iSfy1pag8
	xbODnifE=; b=QOBviTSaW0O1LDF9+ifnXYDX2v9KWVc+K6BkTutjdMymntcoPkd
	/4V2545+/Zg6hL5zy2I/h88r1/RXG7Imb+nJKBaHn04lIbEZRyPi82/YREMRcVKz
	68WnXqDQHnS/anIfGWPwu0neQpevEqrIw+iWV5rCSzyOSSOleOO6Scf3wbNo3jcv
	WS09Z0ByC/rgPxacaw+c3a8xAsNMXBeuY3pSnAQrJRcrVaqfShKy86um+RQrd7C3
	TNlEHWlCzMBKTv6sTBDV1KkQYbhvPql1xSDc3TaBsmP8nLvkh0v0l19g0/xFidMo
	AR9ILzIKUqKbJL8TDQrML8QWbIoJ1O3vBvg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7CpbQBt9mwh0 for <llvm@lists.linux.dev>;
	Wed, 12 Oct 2022 23:13:36 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MnzjW4dnDz1RvLy;
	Wed, 12 Oct 2022 23:13:35 -0700 (PDT)
Message-ID: <4517c95f-1dad-5a8c-5202-073d0a7eff29@opensource.wdc.com>
Date: Thu, 13 Oct 2022 15:13:33 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: drivers/ata/ahci_st.c:229:34: warning: unused variable
 'st_ahci_match'
Content-Language: en-US
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
References: <202210121422.MJsXaw1M-lkp@intel.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org
In-Reply-To: <202210121422.MJsXaw1M-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/22 15:37, kernel test robot wrote:
> Hi Damien,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   49da070062390094112b423ba443ea193527b2e4
> commit: ecf8322f464d62759d838ea62cdeff6966a60134 ata: ahci_st: Enable compile test
> date:   3 weeks ago
> config: mips-randconfig-r023-20221012
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ecf8322f464d62759d838ea62cdeff6966a60134
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout ecf8322f464d62759d838ea62cdeff6966a60134
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/ata/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/ata/ahci_st.c:229:34: warning: unused variable 'st_ahci_match' [-Wunused-const-variable]
>    static const struct of_device_id st_ahci_match[] = {
>                                     ^
>    1 warning generated.
> 
> 
> vim +/st_ahci_match +229 drivers/ata/ahci_st.c
> 
> 76884cb2f7da52 Lee Jones          2014-02-26  228  
> 09de99db23df55 Kiran Padwal       2014-07-22 @229  static const struct of_device_id st_ahci_match[] = {
> 76884cb2f7da52 Lee Jones          2014-02-26  230  	{ .compatible = "st,ahci", },
> 5e776d7b20f040 Geert Uytterhoeven 2022-03-03  231  	{ /* sentinel */ }
> 76884cb2f7da52 Lee Jones          2014-02-26  232  };
> 76884cb2f7da52 Lee Jones          2014-02-26  233  MODULE_DEVICE_TABLE(of, st_ahci_match);
> 76884cb2f7da52 Lee Jones          2014-02-26  234  
> 
> :::::: The code at line 229 was first introduced by commit
> :::::: 09de99db23df55c7415d110f6c62281dedd77384 ahci: st: Make of_device_id array const
> 
> :::::: TO: Kiran Padwal <kiran.padwal21@gmail.com>
> :::::: CC: Tejun Heo <tj@kernel.org>

I am at a loss with this one... There are plenty of patterns similar to
drivers/ata/ahci_st.c doing something like:

static const struct of_device_id st_ahci_match[] = {

        { .compatible = "st,ahci", },

        { /* sentinel */ }

};

MODULE_DEVICE_TABLE(of, st_ahci_match);

For instance, in drivers/pwm/pwm-sti.c, we have:

static const struct of_device_id sti_pwm_of_match[] = {

        { .compatible = "st,sti-pwm", },

        { /* sentinel */ }

};

MODULE_DEVICE_TABLE(of, sti_pwm_of_match);

And countless others like this for STI and other arch too.

So if CONFIG_MODULE is not enabled, how come we are not submerged with
warnings about unused variables ? Is mips arch special in this regard ?
Or am I missing something ?

-- 
Damien Le Moal
Western Digital Research

