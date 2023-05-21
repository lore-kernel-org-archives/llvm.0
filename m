Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306CA10E8;
	Sun, 21 May 2023 09:10:49 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-96fc07d7e6bso10875766b.1;
        Sun, 21 May 2023 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684660247; x=1687252247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ONqA+k2PdNrwTNGtFMp+qsMfrzheNLdGULad2siB7o=;
        b=Bk+tsbsEuINXoCY6OdqJmp0yGhXG5zqKbC7P2qNtr08lHsZLel2RDuFFsZ4uKZ1z6i
         Pktuhsf3njcFHlf/GcaKbgH3cLlVVvuIdhW1rgFNRrYwFbaq70YLBfBwdi2Wz2nCBuwX
         CbGthWec+xbeIbiOGkuHZDHyo0O0mfLOSXMebBHzil5XQF0OXXFde6IwwjqUldLen7Nt
         ut2kq8lGmwd4aZ6mszrieiC04RwYOKx2fFjTOOnTpnKzFmZSpqCvCBo4AUk3uhBDyF8F
         8ipwlDsAiVvPFLXgx5FK4V8jk4EKt5fPXo9iKcBVmXBkXRsAkSctC8s7RlkHvO3pVw9I
         QOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684660247; x=1687252247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ONqA+k2PdNrwTNGtFMp+qsMfrzheNLdGULad2siB7o=;
        b=dFucLo+S+2NRSDQv/qPimYVtpRPaOr+qXK6myka5fuUlZg6CPvBHEbnlhb0grX9BGo
         6M8+LloSusX8mn5vzXZMQr94w8Uflk28EJvkVbuS5l0ZyVjkCnn4fn3dUN66HhZnXekg
         LjdEP8E/T8pk+TK5YsnlIOAHPFQqFWf4muPithIveXsVdN4ZlLzVu6iEdeIW/U8Jzxck
         OCipfNYFtTE7R9kXm+BKfESVFecpSRdDRo13Spm360wNGi6eEDHbuL//4LdYl0FvaHZK
         uenHYAK+p2b88JbXvwjMUNudDldCInea/YBcXybu43n93tOHhbhkjNgsg7BE+oJzdGtN
         BkxA==
X-Gm-Message-State: AC+VfDyeeLDwsm/FVqm4zyxMRTlgc4BMdbqPtyN4wFvqQaziGQPQiqqM
	rw9NwvDOBZJyDk1eigv+YkK7idf3epMzwQ==
X-Google-Smtp-Source: ACHHUZ74KPuYqJDmoNgfffE42ZOTbjQ6alJ7ngcjSSIc28M4wgeY21CaM3ss7b56tWSa9lDfGldwaQ==
X-Received: by 2002:a17:906:1019:b0:96f:4cd0:56a1 with SMTP id 25-20020a170906101900b0096f4cd056a1mr6740417ejm.5.1684660247097;
        Sun, 21 May 2023 02:10:47 -0700 (PDT)
Received: from [192.168.0.105] (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id e18-20020a1709062c1200b0096b524b160asm1648598ejh.82.2023.05.21.02.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 May 2023 02:10:46 -0700 (PDT)
Message-ID: <61f75542-0bb2-e601-60b3-cdefa08cba28@gmail.com>
Date: Sun, 21 May 2023 11:10:45 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [linux-stable-rc:queue/5.15 78/106]
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33: warning: unused variable
 'rtl819xp_ops'
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <202305210810.njuOWlC1-lkp@intel.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <202305210810.njuOWlC1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/23 02:59, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
> head:   632aeb02f8e831197a9a01b1e93cb00b4363be05
> commit: f13ecbca1796208fa2f888843223ea289f8e2b39 [78/106] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
> config: x86_64-allyesconfig
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=f13ecbca1796208fa2f888843223ea289f8e2b39
>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>          git fetch --no-tags linux-stable-rc queue/5.15
>          git checkout f13ecbca1796208fa2f888843223ea289f8e2b39
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/ drivers/staging/rtl8192e/rtl8192e/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305210810.njuOWlC1-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/staging/rtl8192e/rtl8192e/rtl_core.c:29:33: warning: unused variable 'rtl819xp_ops' [-Wunused-const-variable]
>     static const struct rtl819x_ops rtl819xp_ops = {
>                                     ^
>     1 warning generated.
> 
> 
> vim +/rtl819xp_ops +29 drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> 
> 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  27
> 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  28
> 1c099ed63f8363 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Julia Lawall       2016-09-11 @29  static const struct rtl819x_ops rtl819xp_ops = {
> 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  30  	.nic_type			= NIC_8192E,
> b095be37004f91 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  31  	.get_eeprom_size		= rtl92e_get_eeprom_size,
> df85a1313fee7d drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  32  	.init_adapter_variable		= rtl92e_init_variables,
> 460266292de1c3 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  33  	.initialize_adapter		= rtl92e_start_adapter,
> b974b289c4cb8a drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  34  	.link_change			= rtl92e_link_change,
> 072b3948d473f8 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  35  	.tx_fill_descriptor		= rtl92e_fill_tx_desc,
> 63b544a17c63c0 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  36  	.tx_fill_cmd_descriptor		= rtl92e_fill_tx_cmd_desc,
> 7897285ceb2864 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  37  	.rx_query_status_descriptor	= rtl92e_get_rx_stats,
> 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  38  	.rx_command_packet_handler = NULL,
> fe99c77b44e41c drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  39  	.stop_adapter			= rtl92e_stop_adapter,
> 575d48c5753246 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  40  	.update_ratr_table		= rtl92e_update_ratr_table,
> 6d99c68e6f5024 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  41  	.irq_enable			= rtl92e_enable_irq,
> baadea565daae4 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  42  	.irq_disable			= rtl92e_disable_irq,
> dc578b417facae drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  43  	.irq_clear			= rtl92e_clear_irq,
> 78c352b2b22348 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  44  	.rx_enable			= rtl92e_enable_rx,
> 6af7a8b662f6bb drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  45  	.tx_enable			= rtl92e_enable_tx,
> a57165d15dae6f drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  46  	.interrupt_recognized		= rtl92e_ack_irq,
> c9cf5e78f3b28e drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  47  	.TxCheckStuckHandler		= rtl92e_is_tx_stuck,
> 4d73bd2636f51a drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  48  	.RxCheckStuckHandler		= rtl92e_is_rx_stuck,
> 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  49  };
> 94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  50
> 
> :::::: The code at line 29 was first introduced by commit
> :::::: 1c099ed63f8363228a0b075a25511c9feb90e03f staging: rtl8192e: constify local structures
> 
> :::::: TO: Julia Lawall <Julia.Lawall@lip6.fr>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

Hi,

if anybody needs my help please let me know.

I do not know what to do with this message.

Thanks for your support.

Bye Philipp


