Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B5F185B;
	Mon, 24 Jul 2023 07:46:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fa86b08efcso8091915e9.1;
        Mon, 24 Jul 2023 00:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690184797; x=1690789597;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXQxRuD8J7RHydWYdts0LDcLZy5e3i/QIlpY808Udx4=;
        b=e1ln4qjW+db2XZu+RYtvHneZOMBlgf1RXmamoBvW0yzFUSB4fReYuTJXwyDBQoLo+n
         HOH5Wqp59PRL37R9Y8j59xWdXa20hCY/8I8dpmMljpzxHgH4B0NUWaB93WW7qcUPj4D2
         VVBNvcijnbSyUIGZxU6aLySiqjw8B8SXDoRZ2MLEKF+4ch7kV3j4U6j2URQCXsPVVwYt
         eMyZHqtuc0lHw12QhbIvVpLVYRgaCAZPieaZxBv78y4pqVfzbz5kJB405H8iSbk1l34o
         aGgRBHmo+ur3Uz/ElH7B8yEWiCKg2c14Cbl3sfE+SHAMndifQwIhpTDnwxVfgt6a/LM7
         8+dA==
X-Gm-Message-State: ABy/qLbTgea2yB0w9UY7WHM3YL5zr1u+5aVSOdHPb3fobBvv2w/f2MLv
	KVKmghlQrcPLgf44VU3f6Xk=
X-Google-Smtp-Source: APBJJlHVjb6OjzXn+nznEqYiOlBN2rZAzojWF+Z29xx7p/sURSAURyBJG7EsZwds0jMPqwjYVJQQ1w==
X-Received: by 2002:a05:600c:3b05:b0:3f9:88d:9518 with SMTP id m5-20020a05600c3b0500b003f9088d9518mr7657174wms.0.1690184797014;
        Mon, 24 Jul 2023 00:46:37 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id k22-20020a7bc316000000b003fd2d33ea53sm5361223wmj.14.2023.07.24.00.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:46:36 -0700 (PDT)
Message-ID: <840cdf34-f38e-ab37-623f-9744c3436350@grimberg.me>
Date: Mon, 24 Jul 2023 10:46:34 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: drivers/nvme/host/tcp.c:835:12: warning: stack frame size (2256)
 exceeds limit (2048) in 'nvme_tcp_recv_skb'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Varun Prakash <varun@chelsio.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
References: <202307201141.PYWS6ird-lkp@intel.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <202307201141.PYWS6ird-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/20/23 06:10, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   bfa3037d828050896ae52f6467b6ca2489ae6fb1
> commit: c2700d2886a87f83f31e0a301de1d2350b52c79b nvme-tcp: send H2CData PDUs based on MAXH2CDATA
> date:   1 year, 5 months ago
> config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230720/202307201141.PYWS6ird-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201141.PYWS6ird-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307201141.PYWS6ird-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/nvme/host/tcp.c:835:12: warning: stack frame size (2256) exceeds limit (2048) in 'nvme_tcp_recv_skb' [-Wframe-larger-than]
>       835 | static int nvme_tcp_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
>           |            ^
>     1 warning generated.
> 
> 
> vim +/nvme_tcp_recv_skb +835 drivers/nvme/host/tcp.c
> 
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  834
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03 @835  static int nvme_tcp_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  836  			     unsigned int offset, size_t len)
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  837  {
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  838  	struct nvme_tcp_queue *queue = desc->arg.data;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  839  	size_t consumed = len;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  840  	int result;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  841
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  842  	while (len) {
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  843  		switch (nvme_tcp_recv_state(queue)) {
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  844  		case NVME_TCP_RECV_PDU:
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  845  			result = nvme_tcp_recv_pdu(queue, skb, &offset, &len);
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  846  			break;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  847  		case NVME_TCP_RECV_DATA:
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  848  			result = nvme_tcp_recv_data(queue, skb, &offset, &len);
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  849  			break;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  850  		case NVME_TCP_RECV_DDGST:
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  851  			result = nvme_tcp_recv_ddgst(queue, skb, &offset, &len);
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  852  			break;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  853  		default:
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  854  			result = -EFAULT;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  855  		}
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  856  		if (result) {
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  857  			dev_err(queue->ctrl->ctrl.device,
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  858  				"receive failed:  %d\n", result);
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  859  			queue->rd_enabled = false;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  860  			nvme_tcp_error_recovery(&queue->ctrl->ctrl);
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  861  			return result;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  862  		}
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  863  	}
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  864
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  865  	return consumed;
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  866  }
> 3f2304f8c6d6ed Sagi Grimberg 2018-12-03  867
> 
> :::::: The code at line 835 was first introduced by commit
> :::::: 3f2304f8c6d6ed97849057bd16fee99e434ca796 nvme-tcp: add NVMe over TCP host driver
> 
> :::::: TO: Sagi Grimberg <sagi@lightbitslabs.com>
> :::::: CC: Christoph Hellwig <hch@lst.de>
> 

I don't understand how the stack frame size is that big. Looks like a
wrong complaint?
