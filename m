Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0C1FA3
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 22:51:06 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-564cd28d48dso1693135a12.0
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 15:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693263066; x=1693867866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4nyTONQLjQNGWZ4CdwYM7KX6zvJ5hhuHchlfrQVnFg=;
        b=U/jGmUT4ZMYOwz1wyVXxKZzwd5Z7io9GqpQrDOrUqXUDPkOP69ywj9jTtekn/lPlKF
         +jI7KSDKs01z02xFMIaNQDOvk5Id0q5I/ftVNN9Pam8s85ySBUKRx5riBy+U9MXhbsC0
         WQl9Xc5fR7pgKuFqfaXTF8dec/+/LknMu9jbFswg8KZ80ZoydNjjssClQiClaGamRMbF
         RdTCfgvGzPbD0FGFv+8hQABCf0cN2lQY5j9zDwEzU2tsbIseHmaomEG6ujOP4bzA/UHF
         jbMWpV67UbmA2V5YyOGk0EMZEpfSOmOBFHj3ScjqfvZPeRep86fy2nszVjhHN5UKATfT
         OVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693263066; x=1693867866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4nyTONQLjQNGWZ4CdwYM7KX6zvJ5hhuHchlfrQVnFg=;
        b=eGXU9MTy0MS1Hb+t6e/aQH3iPZa4LnxmtHfNU0YK0tsS/1Xw5gC1QM9FkUlWbiTtVJ
         2ZAUKe/oguWhQmmibO2SHxxiIgQglTxQfsf1TKr2hmsruSYoINkjxv0ugp26+E8GaUyG
         nkMYONflph+bnx7vIckrcGuzKiQfC+LCHyb/DxJDhrPRaLUfElRTx6WSdYWYRALMUw/n
         sL9YGeuJoMT+PY3ZUgzXzTnN/DF4iF4BbaeaAH7zCuEun7/tnhhxAVMIpycUh+ynSXeU
         xoe5h5pq5FLZckf+7ZMVXEqScas3WQ6d6/ud3t89k2h25m+GckhfAPii/Ua7EBS/5y/W
         RWxQ==
X-Gm-Message-State: AOJu0YwKepM1awPuK6jJbSPnC6EQfmEkufw6hjPNTnZb4oDG79RHzQSr
	JY62AP2mksyp8pWrQEbZYwucvA==
X-Google-Smtp-Source: AGHT+IFhgZce2iRj25QUKt5ra95exWE6EmZCshSfmAByuDSFGHPibt9BU7lzSXl6OJECuiWZ8kwf1Q==
X-Received: by 2002:a17:90a:b10f:b0:271:ab23:6288 with SMTP id z15-20020a17090ab10f00b00271ab236288mr871992pjq.14.1693263065657;
        Mon, 28 Aug 2023 15:51:05 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:b64:7817:9989:9eba])
        by smtp.gmail.com with ESMTPSA id j15-20020a17090a2a8f00b00262ca945cecsm10108812pjd.54.2023.08.28.15.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 15:51:05 -0700 (PDT)
Date: Mon, 28 Aug 2023 15:51:00 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'Heiko Carstens' <hca@linux.ibm.com>, Jens Axboe <axboe@kernel.dk>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan =?iso-8859-1?Q?H=F6ppner?= <hoeppner@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/1] s390/dasd: fix string length handling
Message-ID: <ZO0k1Par4i4FBCWF@google.com>
References: <20230828153142.2843753-1-hca@linux.ibm.com>
 <20230828153142.2843753-2-hca@linux.ibm.com>
 <f0419f6428ad404386ebca813dc1ec03@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0419f6428ad404386ebca813dc1ec03@AcuMS.aculab.com>

On Mon, Aug 28, 2023 at 05:18:37PM +0000, David Laight wrote:
> From: Heiko Carstens
> > Sent: 28 August 2023 16:32
> >  	if (strlen(uid.vduit) > 0)
> 
> Does the compiler know enough to optimise that brain-dead test?
> 

For the purposes of skipping diagnostics, no; clang performs semantic
analysis BEFORE optimization (which is handled by LLVM). As such, clang
will produce diagnostics on dead code.

Partly because LLVM isn't very ergonomic at emitting diagnostics from
the backend, partly because Clang code owner and developers don't want
clang to emit diagnostics dependent on optimization level.

I disagree with my compatriots, and you can read more thoughts here:
https://discourse.llvm.org/t/rfc-improving-clangs-middle-and-back-end-diagnostics/69261?u=nickdesaulniers
