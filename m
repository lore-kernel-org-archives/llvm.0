Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125C746E
	for <llvm@lists.linux.dev>; Thu, 16 Feb 2023 14:52:17 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id r9-20020a17090a2e8900b00233ba727724so6069585pjd.1
        for <llvm@lists.linux.dev>; Thu, 16 Feb 2023 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vwy/nvSACPs3saFn3MC2GpZOqXyVXmgpysdDNeISxL4=;
        b=cwz68VlmDebluJTDd3kSMGJs+22jJVLh0Fv0bcrZcbxWMLknLTS+Tig93Lq9LNTuwY
         V5SiifT7xi1tRId07N0GCnnM4k3LCV4L7xKXbW8uFDrmLNNXcErsIb8FkXig368+U8IB
         gwH2+13ufQE7YAbNisWxG/gB4r1KN0MAw8jCMwuAkmZcpZ5SUmMOhPUUT4OizXTOOKUu
         2c9a4jwgTkeHUBZ73M4rJWvghAt/bBReKj25J4ixRMSVPADaSpbbQL6/CBnR8+fpnv1N
         kk77iJW7wxWjk6/XNHa1gBmb0yXMD6kiD2jinSUPkYeQ6Y2GPG5/5r4thQ7xTjtYro0k
         tQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vwy/nvSACPs3saFn3MC2GpZOqXyVXmgpysdDNeISxL4=;
        b=BwPVC/ampNjkYvt6BFFhehfusPJSw257EuVJ+PUVNn5/jLa7y7/yjw1wS+Bn6/Rfwi
         P5oGcukV491ba3ADoup35/2hSiY/uBgZ5HCjzZL61mfzwB2h2PaRha9hjOztu2m+0bdp
         s4f0BJLCa0D06yO1jdePQ/ciVwW+YDHht63SPjRbDvuONEagcD1GD/SL8WFv0FgGlVmD
         O7XVICCWGw3/aBZWA0X7BQa4/ESM8rmPwzLo995C8I3WJAJpvjiAqemO1Y+ZLRvmU7n+
         GeLdTcHLUKWefb+cQAa0luEUzj2+J1gQn8iiG1pfmD94XwwDlY9oWVmVtv+rC83G0mU3
         JzuQ==
X-Gm-Message-State: AO0yUKUUtIOktBMiWV7Ca1e4jZqujZ/czPYL44rwAVsTJ04wJmAuwfjz
	RXuBxEFQL2lc8dt0LZVEk4s=
X-Google-Smtp-Source: AK7set+7/LSgLUnPubFXxsFw4TXLoT5TlodOzauYcx+mvORzOE91ehJg5BdcehvsXAQ3G3HCcHMguA==
X-Received: by 2002:a17:90a:c782:b0:233:ab9b:f86a with SMTP id gn2-20020a17090ac78200b00233ab9bf86amr7033557pjb.8.1676559137218;
        Thu, 16 Feb 2023 06:52:17 -0800 (PST)
Received: from awkrail.localdomain.jp (p182177-ipngn200503kyoto.kyoto.ocn.ne.jp. [58.90.106.177])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090abd1700b00233db0db3dfsm3388472pjr.7.2023.02.16.06.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:52:16 -0800 (PST)
From: Taichi Nishimura <awkrail01@gmail.com>
To: rdunlap@infradead.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	awkrail01@gmail.com,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	deso@posteo.net,
	haoluo@google.com,
	hawk@kernel.org,
	iii@linux.ibm.com,
	joannelkoong@gmail.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	martin.lau@linux.dev,
	memxor@gmail.com,
	mykolal@fb.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	netdev@vger.kernel.org,
	sdf@google.com,
	shuah@kernel.org,
	song@kernel.org,
	trix@redhat.com,
	yhs@fb.com,
	ytcoode@gmail.com,
	gregkh@linuxfoundation.org
Subject: [Re: PATCH bpf-next] Fix typos in selftest/bpf files
Date: Thu, 16 Feb 2023 23:51:45 +0900
Message-Id: <20230216145145.548183-1-awkrail01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4753a724-2fd4-3672-c7ce-0164fe759eea@infradead.org>
References: <4753a724-2fd4-3672-c7ce-0164fe759eea@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This text is not needed in the changelog for a patch, please read the
> section entitled "The canonical patch format" in the kernel file,
> Documentation/process/submitting-patches.rst for what is needed in order
> to properly describe the change.

> thanks,

> greg k-h

> Hi,
> The corrections all look good.
> Of course, you need to fix what Greg mentioned, then you can resubmit
> the patch with this added:

> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> Thanks.

Thank you for your reviewing and advices.
I am a beginner so they are helpful.

I read the docs and re-sent a patch.
After sending it, I found forgetting to reply to this thread...
Sorry in advance.
