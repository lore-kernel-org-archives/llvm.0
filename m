Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474C34417
	for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 09:28:08 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3110ab7110aso1691697f8f.3
        for <llvm@lists.linux.dev>; Sat, 24 Jun 2023 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1687598887; x=1690190887;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yALLPmOE7+hISGtYfMqKGpt/k5yG5q3Ed3XuC87leZ8=;
        b=Qv1Ua19tBkqyWfEwzA5JBVMzDRypzLj5juPHXL9MXlsxlPXF+KUNdGNDgktJlSrrTY
         0uUhXsfhl7DT+xVr7gb5ezCgaLruQC8cSfGL0mSvEzc+qr7S+JFU40WMbb2bl9TRwARX
         1ilpKnmsf105pKf+wJr3h9nsLH6kiCqFkud69H0mDwaB0ua0WTRnEnpGDZeb7War868m
         YprPYPiWM5MPAulDrmbxAOJcdh/SzuU4jL6hiTIE+hdqHOJmHR6DFGzz5FaP/44hcPM8
         jLnr6pYgF0jSh5Bdla2vC727/GtxmPoV0YvDpU9iuyQPkS/y2szdsUA1sgV+jnU+CXH0
         QQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687598887; x=1690190887;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yALLPmOE7+hISGtYfMqKGpt/k5yG5q3Ed3XuC87leZ8=;
        b=OpsoBv1jJe3OmeY0ZZbsqKtbDeSZwmYHWRMzr3Nr1rqBfzIARtYgmmsgTwEAxZjAYK
         y5XdJacYhPJTDvM5gx4Fo1BHKvVyf88q0GGeTt9r6OLnbEVl5aq60+cx+T/KYt9JxyVW
         Gm77Gt0B4U2a4PquQhtk5vvKLqXKHcC1X52eaqBVAE1JAv4HYnnIWGbI1A5Xl6uOYqFj
         cYqdKL+r/6Qeu4785EnI+N5aXodG5ehfsSvi3mo7xF9wv2Ys1Vu11YyXyZu8g73ykqoC
         r1yMO//oLTBU7zq9OVALay8fyQxj3q6kuC1RZv7zlgFlH3kaM8EhTB0bJ7pdStxcMaJA
         tpdA==
X-Gm-Message-State: AC+VfDzv1H0zKbsnur9NrT+wTO3ZQOKce7eN/XVU7rwA7vRA2+pQtkOW
	xOQ6TThjbxD5aBpKsSD/RceY1A==
X-Google-Smtp-Source: ACHHUZ7UZ43FKF6Jax69cdaAZdJa6U/q1U7TusiAstVCGhkk0TjGj6cLc/jLumslzqFBTp16WULcow==
X-Received: by 2002:a5d:6ad1:0:b0:2f5:d3d7:7af4 with SMTP id u17-20020a5d6ad1000000b002f5d3d77af4mr18514644wrw.63.1687598887140;
        Sat, 24 Jun 2023 02:28:07 -0700 (PDT)
Received: from ?IPv6:::1? ([2a02:8011:e80c:0:9f:41d5:6eae:4002])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d50cd000000b0030647d1f34bsm1652247wrt.1.2023.06.24.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:28:06 -0700 (PDT)
Date: Sat, 24 Jun 2023 10:28:05 +0100
From: Quentin Monnet <quentin@isovalent.com>
To: Fangrui Song <maskray@google.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, bpf@vger.kernel.org
CC: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Yonghong Song <yhs@fb.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_bpf=3A_Replace_depreca?= =?US-ASCII?Q?ted_-target_with_--target=3D_for_Clang?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230624001856.1903733-1-maskray@google.com>
References: <20230624001856.1903733-1-maskray@google.com>
Message-ID: <A886FC2C-35BE-4215-B9FD-61B62EC56ACC@isovalent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 24 June 2023 01:18:56 BST, Fangrui Song <maskray@google=2Ecom> wrote:
>-target has been deprecated since Clang 3=2E4 in 2013=2E Use the preferre=
d
>--target=3Dbpf form instead=2E This matches how we use --target=3D in
>scripts/Makefile=2Eclang=2E
>
>Link: https://github=2Ecom/llvm/llvm-project/commit/274b6f0c87a6a1798de0a=
68135afc7f95def6277
>Signed-off-by: Fangrui Song <maskray@google=2Ecom>
>Acked-by: Yonghong Song <yhs@fb=2Ecom>

Acked-by: Quentin Monnet <quentin@isovalent=2Ecom>
