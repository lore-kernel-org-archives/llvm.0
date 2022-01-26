Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D397C168
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643190556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KA0Nc0ItX75FPgCyERB0WlF5d7038F/ySzLM0IrXiEw=;
	b=OXpFzrnXPcsQh7IP2aMJe3dek+cUpBp6vRcdqeIHZTKiwRz7bNZr2GBpMkA5ghbug/PpEq
	uobzLe3wRcyp1VqfTRcc/tqFWdAFrYMf/REe2D4QSA8Gfy/FS4fG4UJ1XiE9PU44u6v3v6
	BD2kw5+kNs/c3MEQyGfebkplYF781Bk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-Q-sTeU2hN72phzNoqWYGHQ-1; Wed, 26 Jan 2022 04:49:10 -0500
X-MC-Unique: Q-sTeU2hN72phzNoqWYGHQ-1
Received: by mail-oi1-f197.google.com with SMTP id t6-20020a056808158600b002cec2812d52so555471oiw.9
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 01:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KA0Nc0ItX75FPgCyERB0WlF5d7038F/ySzLM0IrXiEw=;
        b=fM8kWde+8ogFlj1riScUQG+VRcb9awGQU+nOxwHDCHXz8ls035jwtOK8NQzoQTxB59
         XDc05tmMzEGQQ0e+OHgH1JNB0ogzSUuEPTy6kM8boVvBIuBLx4zKWbV6s4usR6RuJQrl
         QnfS2W4FJkr2cVCl6iZmN3WfMfvduUurk7mqNYZeLEhOlRE8pmIAgsrf2MbANafl4FsC
         H9HfUKmz0CcC9qEmtMW2A4PZT7IIBL+bMSLdx8AgIiGRrr8RY0PhP7MSy1t87czieRim
         4/ar/4baRVNIejzgnp+4+LRK30pLDMoFnCUtvltb6WcmGxKehYeTjyKN3sUcuQyAtxXf
         DFug==
X-Gm-Message-State: AOAM533zI6arhsmTHtnRckNA5p/Br/N3KNaqTf+InVNP6kwlfPgzO1vs
	Q0z1NltCrGJmGmCH9C00s/mOYotsc+B+MwQC310TO3KKvdNHLx+/ab93WmJf9T1A6NMYwA/Srrs
	HJO7bwMaCHiX1hysljAcT/atmbj89lA==
X-Received: by 2002:a9d:24:: with SMTP id 33mr17139534ota.85.1643190549872;
        Wed, 26 Jan 2022 01:49:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCVH2FeXnCA6N4JnyJK5PfG1N1gtYzEdZPUmu0B17IXyrRcIBhbE5wS+lu6TRPlh1p3TVmBZrO6OkHmakiitY=
X-Received: by 2002:a9d:24:: with SMTP id 33mr17139530ota.85.1643190549681;
 Wed, 26 Jan 2022 01:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cki.LKX9M86D1UOULT0MYKRS@redhat.com>
In-Reply-To: <cki.LKX9M86D1UOULT0MYKRS@redhat.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 26 Jan 2022 10:48:52 +0100
Message-ID: <CAASaF6yO05hj_e-XwpuiMmvSm8zpj+v5YP4_+qHdsOegFAEUVA@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IPCfkqUgUEFOSUNLRUQ6IFRlc3QgcmVwb3J0IGZvciBrZXJuZWwgNS4xNy4wLXJjMQ==?=
	=?UTF-8?B?IChtYWlubGluZS5rZXJuZWwub3JnLWNsYW5nLCA0OWQ3NjZmMyk=?=
To: CKI Project <cki-project@redhat.com>
Cc: skt-results-master@redhat.com, llvm@lists.linux.dev, 
	Memory Management <mm-qe@redhat.com>, Li Wang <liwang@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 2:35 AM CKI Project <cki-project@redhat.com> wrote:
>
>
>
> Check out this report and any autotriaged failures in our web dashboard:
>     https://datawarehouse.cki-project.org/kcidb/checkouts/30259
>
> Hello,
>
> We ran automated tests on a recent commit from this kernel tree:
>
>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git
>             Commit: 49d766f3a0e4 - Merge tag 'for-5.17-rc1-tag' of git://=
git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
>
> The results of these automated tests are provided below.
>
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>  Selftests compile: FAILED
>              Tests: PANICKED
>     Targeted tests: NO
>
> All kernel binaries, config files, and logs are available for download he=
re:
>
>   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?p=
refix=3Ddatawarehouse-public/2022/01/25/456059085
>
> One or more kernel tests failed:
>
>     s390x:
>      =E2=9D=8C LTP - syscalls
>      =F0=9F=92=A5 LTP - fs

discussion about binfmt panic here:
https://lore.kernel.org/all/20220124181812.1869535-2-ztong0001@gmail.com/T/=
#u

