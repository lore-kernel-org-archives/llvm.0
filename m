Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51041FB4;
	Sat,  3 Jun 2023 22:39:57 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6261a8bbe5fso31738116d6.0;
        Sat, 03 Jun 2023 15:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685831996; x=1688423996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avPQKTaRTbQOf47fI/68sylNjg8MrdY+tDB4lutGoKA=;
        b=bWPKjbX1WHje3OwsfHu50Fmv93XMVMAsfBHGy+qd0kone17LdtcvW5n1VFQtef1iCe
         kssIrs/Fuebjh7PxXv1PeE+uYdYdmE6mKScZA7F3qY5VgeOVCeG+5ubLSZJlpdr3400n
         6kEIb3hwFIPXqHtKCb01HWuWUb5itb85qUgJ04EZmLl3S+p8JffKN0BQuLCcc1fPBC1e
         4i2fbeitsu2Deec1uSXEp4ZDD11za9Q6uQWOQ4n8nuhRxZA71libo6Bpq4Emz1ekd2WB
         vnN0MvYxITTsZ4kmxsZENiMgLGI+AFHp5m2tUFYG9CnmNPZWmF0Ds2S6v4GWuAS+QS73
         fryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685831996; x=1688423996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avPQKTaRTbQOf47fI/68sylNjg8MrdY+tDB4lutGoKA=;
        b=dyhZmAOwEXCApbiNh7HgMyKDkdhHnlW7i5//Iu0RE8jxnITZHEpWXL6TME3UC7RLyI
         rVihz7zz+N0Jmm9mbknB1zy0GzZWBShoWFLycKmpEDBjoD+VLkKQvNPlzE8ZB/PqTEOg
         rnDhp/vrqV7/wRv2kvR37fwBcnpsIb3/7QCgshjKFp5s6KAaLkzHmJu2c7W3pL9ybokW
         PP/APslbUMy0CbixTO4g/LhevplpwTDOE9nvEUiYIUpZzXBtdebH7QBOrV1KQln8Q15u
         4sHsNdjXcEsLgOJ15wi//G9D4tfwQDk6L1xRiejBN4hMX3wNL/kghqmviKFdDmyPXDjm
         a61w==
X-Gm-Message-State: AC+VfDzQ+31sElIzvTKFx3mlwJiSsUHM58KFE8CddEAu11l69hh7s/tC
	AS8CQfkotwMLyHKqqx2dZt8=
X-Google-Smtp-Source: ACHHUZ706ov2HEYCut18QtmMrGMxpPGEb5nd/bunaJ2kZs4pLG61SXSumN4u3AuwggHDaeEEmRXxaQ==
X-Received: by 2002:a05:6214:2687:b0:626:3bb1:b9b3 with SMTP id gm7-20020a056214268700b006263bb1b9b3mr3475548qvb.4.1685831996546;
        Sat, 03 Jun 2023 15:39:56 -0700 (PDT)
Received: from tian-Alienware-15-R4.fios-router.home (pool-173-77-254-84.nycmny.fios.verizon.net. [173.77.254.84])
        by smtp.gmail.com with ESMTPSA id dd18-20020ad45812000000b006212456fd8asm2569896qvb.100.2023.06.03.15.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 15:39:56 -0700 (PDT)
From: Tian Lan <tilan7663@gmail.com>
To: axboe@kernel.dk
Cc: horms@kernel.org,
	linux-block@vger.kernel.org,
	lkp@intel.com,
	llvm@lists.linux.dev,
	ming.lei@redhat.com,
	oe-kbuild-all@lists.linux.dev,
	tian.lan@twosigma.com,
	tilan7663@gmail.com
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Date: Sat,  3 Jun 2023 18:39:55 -0400
Message-Id: <20230603223955.827968-1-tilan7663@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <da0ae57e-71c2-9ad5-1134-c12309032402@kernel.dk>
References: <da0ae57e-71c2-9ad5-1134-c12309032402@kernel.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Jens,

I updated the patch with more detailed description of the issue. Could you
please take a look again when you have a chance and let me know if there is
anything you would like to make a change. 

Best,
Tian Lan
