Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77671EA6F
	for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 11:46:44 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-565334377d0so5622690a12.2
        for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694605604; x=1695210404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nITPxVDnC41/6mqrOtoGNiOb/yuzadv3G0v6KlC07k=;
        b=WCaDtXvD9EEtoN91qlDvaPypwpOTYQWPx3Uwcgt8hAMiHLCFKuKuNEahDrYCL1nOEF
         qoPnJFqsJNis+XdR77iKW1hXCLeQ6DK3E1cODISr293KPmUypH9BXovUIVA15fIDoD5+
         x4u/pEJJySGud4s1q3sG/0G4VGCAPE3nQXdjOIoDOLuRUJhMdzzgk2MYBzbaIO3qtaRS
         t9oQ++F8XZ/jtIC3i7xLck1d03oByACcX+W/hPrcVFS2ssvneo8x7EL5B4wR2Tvm/56V
         dnDhIe95abUW7KfIGzhRz6frVk1FTTFnLWP3FW8yI7bDGDTpYXHDT519axh/JCN2EGb7
         43EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605604; x=1695210404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nITPxVDnC41/6mqrOtoGNiOb/yuzadv3G0v6KlC07k=;
        b=W4+btjfqBIoln2Gj7CHiEqMkG0uKlX/FmuVrzHq6zzeQDNiEhIKsc71BS3bIEJGqec
         V69vMfOqli8Idd8Aqp9dJEGHbWVMCc7HBRSNJMSdpDVY9byW3zroMMYg8Mh/WIY5A9rC
         BDTxgU0Biv7skgR2yzTmWhYj1GJ50mkMsSFwGVwhOO7cv8vSgDqsnEzORsnAvzurxS7j
         /3B64wiQHRDO2u5OssPv2EWj1jWwVkQAmaFtBe5PNAFJQwHxDJglR6kSfzNsFyiG7IfC
         zDcbzkWYUWcntFA436v43d8FDh7rNrffPV8YWc/kTRnzbcxuTSZgv7Qoj8YV4K8vLRjB
         DAkw==
X-Gm-Message-State: AOJu0YzcEGchHElewpI5RFrdPIDncN3PRZd1r9aALGvXjbVvvm1ssLEy
	sBFrCVBhp40+ryDIrFE6DR7bbQ==
X-Google-Smtp-Source: AGHT+IF5VM5hzkBEO13mv1Q/VU2jY3YJ+ax2K89xqvIKqKVeOhgZo4a5+WbdKRLdhkgdM/NeHs6qXg==
X-Received: by 2002:a05:6a21:3e09:b0:14e:b4d5:782e with SMTP id bk9-20020a056a213e0900b0014eb4d5782emr2104693pzc.29.1694605603948;
        Wed, 13 Sep 2023 04:46:43 -0700 (PDT)
Received: from PF2LML5M-SMJ.bytedance.net ([220.243.131.6])
        by smtp.gmail.com with ESMTPSA id iz2-20020a170902ef8200b001b5656b0bf9sm10246025plb.286.2023.09.13.04.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:46:43 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: lkp@intel.com
Cc: gregkh@linuxfoundation.org,
	guojinhui.liam@bytedance.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizefan.x@bytedance.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	rafael@kernel.org
Subject: Re: [PATCH] driver core: platform: set numa_node before platform_add_device()
Date: Wed, 13 Sep 2023 19:46:31 +0800
Message-Id: <20230913114631.2966-1-guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <202309131848.CgiiHpZu-lkp@intel.com>
References: <202309131848.CgiiHpZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Hi guojinhui.liam,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.6-rc1 next-20230913]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/guojinhui-liam/driver-core-platform-set-numa_node-before-platform_add_device/20230912-151119
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20230912070900.1862-1-guojinhui.liam%40bytedance.com
> patch subject: [PATCH] driver core: platform: set numa_node before platform_add_device()
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309131848.CgiiHpZu-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131848.CgiiHpZu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309131848.CgiiHpZu-lkp@intel.com/
> ...

Is there anyone known how to stop this test for my first patch? I have sent a new one to review, which fixes the compile bug.

thanks,

Jinhui Guo
