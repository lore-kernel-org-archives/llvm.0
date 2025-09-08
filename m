Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA02DCF4C
	for <llvm@lists.linux.dev>; Mon,  8 Sep 2025 20:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362769; cv=none; b=sp02rJ2SoO5FCh571GG/o5dxSG2wijXzz6t8+tDtYtznMEBghNtqx2Ep/+6/qKdHC7HKY2yRD9LAmEQHDcij638H8EcDJRlEnYl/CJMnVs8x+vaCK754/+4podmyz5kvUTqwoLEH38jZaecU2W5PKuU0wuadB6Ocwe2mshY8JXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362769; c=relaxed/simple;
	bh=bEKhAzri7BBrxNHU6CjKqcmbERBZnrPEV1ur7Br4EzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8+MO5PFTJSCvwgZmQZpoFTlUl1fXoaoHJOfiwAMUlzIls8aNxK6pqnc9hUyp9GVb8hm3EoZv2Lpn5OEDxRODSK5KA75sn89ol71lspihBug0LrtD+cxhYK8TDdpFcyoqgC1Z8kPn3EDT4/mTlI/qTjpszhOg93xRssyxQiM0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7hggPhL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7hggPhL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so8740695e9.1
        for <llvm@lists.linux.dev>; Mon, 08 Sep 2025 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757362766; x=1757967566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEKhAzri7BBrxNHU6CjKqcmbERBZnrPEV1ur7Br4EzE=;
        b=f7hggPhLMsgqBCDsFCsiGj9A2kMjcfvF1rlODP1Ab9HPuKBeopuJQglWf5yBDbxtpH
         uyZzUNeZhN/YJoOhl6+gOjgAY5gaM44ZbH8EP2uKJHuwzTOBLGF4I5MtgH5JCJ/dWXu1
         fZyg6hcrfge6STi+xZJ3VoSYbOKDdn0zY0pn89Fy7VAajLQBGdTWdc7Ue7Smbx04amRQ
         XbVz/5b7awxq6sE63QsEVKzz57xlEXnPPFahmrmmI7MWW1WGB9R0K0Iv+AP2w0FdD238
         2ohK92iBIDUoE+7B7vMYB0Cy9tI6tiImoIpey4XfRZodjOTrZ5kcC6cliBQ2pZeuSHYA
         FrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362766; x=1757967566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEKhAzri7BBrxNHU6CjKqcmbERBZnrPEV1ur7Br4EzE=;
        b=v1Nw8fpN3N+P8dxNhNtnXOUl3h66duw5vE6naBKAOKXt+ZgZsDrdOn0eBJs2INUIY6
         Fq9vY4ceR0kqalVs95bWJji2oeHCLCT7vKEAdtWhxrs1qUFaC068gAQOxtzAMXyUxD14
         a/9MsEHGNek5DhIKRb7jgFj/2s+SqfWMI2rd8u/RMTD3Qp9fBOMaDdCbnMC+r+32Hmg8
         BbY0JCygXKL9e12KmEarASz0kwJ8PLNzXhAYgWbrXDZA06Gs9oQZRlCu8CB6mhdFlhcd
         7E3TWdclMtzm/2l80/uyllAmC3zuIfiB/WT0t2oJzSI2PZnFZMGjI4BPedCBERT758pX
         PJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoz8ly8t3kyhtknqZE5++zr5xuZZiPp218I9/XE/I4emTbJ0tJFFe/8ATZX2JFu6mu22ay@lists.linux.dev
X-Gm-Message-State: AOJu0YyN1a9Xrn/UmQhVlG3iCL+L6TPsuemcgCKbzW6Xvg+PP+UVsnk0
	4yQlLgWih81b7bwVCNfLSLJ0K8wiM3ZFUKFDYk3nEvMoKP1LxBdHsxRwjxE/agplii8kUpx3Vrd
	PyL7qnRQTL+wi3kXeV2JPIYb8917QL0Y=
X-Gm-Gg: ASbGncvNGZ+ogVu9hSQrXzwtHfds7yoX5Tys2a/aZKADPj8MQk8W1p4OqeJdHA7wDh1
	T4u8esUthEIeJc3N0hEsRkTcbpISZ3toFkkjDBDGqNlaqamZorkIOGOTCdkv00km0WaRfrxaGQB
	0ELBCnhdmnvJWHHkPcPP07nUpQTCmPlSpt3PBG3ko7zaNzwZkOUl+0Ss5hFWHnYTXmtqLAktTYZ
	8p20xDwz4k/mzz6MMU=
X-Google-Smtp-Source: AGHT+IETXcCyuhskt8NfiuIvMZk4HNrRqt02JjM5fpQLtTPCEi8+CDkXKLs0cMppBKfL27M9u+6qWLgrHDP5cvo0P64=
X-Received: by 2002:a05:600c:35d3:b0:45d:98be:ee8e with SMTP id
 5b1f17b1804b1-45ded05bcd0mr4878465e9.1.1757362766098; Mon, 08 Sep 2025
 13:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZedGwtMThKjFLcXqJuc6+RD_EskQGvqKhV9Ew4dKdM_Og@mail.gmail.com> <2xfriqqibrl7pwvcn6f2zwfjromyuvlxas744vpqrn2jthbzu6@nrhlxafjpfnr>
In-Reply-To: <2xfriqqibrl7pwvcn6f2zwfjromyuvlxas744vpqrn2jthbzu6@nrhlxafjpfnr>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 8 Sep 2025 22:19:15 +0200
X-Gm-Features: AS18NWDjLBMTDDx-3GcgskVrIFrWTkldm4ARgshAhph95s8X05Rv1arvNW2pjfU
Message-ID: <CA+fCnZeem3pBPfhQyPiSAUfp5K0YdHFuRs0FZykF03YXVS-f1g@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] mm: Unpoison vms[area] addresses with a common tag
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:12=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >Do we need this fix for the HW_TAGS mode too?
>
> Oh, I suppose it could also affect the hardware mode since this is relate=
d to
> tagged pointers and NUMA nodes. I'll try to also make it work for HW_TAGS=
.

Ack. I suspect you won't need to provide two separate implementations
for this then.

Also, could you split out this fix into a separate patch with the
Fixes and CC stable tags (or put the fix first in the series)?
