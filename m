Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13B837C;
	Thu, 16 Mar 2023 01:34:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cy23so1615996edb.12;
        Wed, 15 Mar 2023 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678930486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHPrPlhQMXvVIx5yQs1BZudV0Tq662a5tALQ28pCnKM=;
        b=mAqtdeca2p22E35wvY1/4iKixCVK07hdLBG5Ugy4zEY1s9ggOUYObNQVdjHof6MmmH
         9ojw0wblcE/A5lWVrWGiTxJTUUbSS2djzAGPStxpwhI+dfW9B1gvfdcN2dZp3n9a0IXp
         V/kMor6QFxSa2muVrsF3fkRTlTitH57vr2nymhNG29FS7xVEtPmmGNfzIzWCMVlhh9s8
         CP/74Z2X+k0fEaU3bhb7DnVG4TKktcSmanSCGpPRIjxQx/NPHu9oYZWBURK+LDDi51W2
         2DdO2l29KyH53y0jv8q5GYnTIb/pHkuhjhYYZ+BiWGudR12y3+508v9bU8VwkmBB3AgK
         1uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678930486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHPrPlhQMXvVIx5yQs1BZudV0Tq662a5tALQ28pCnKM=;
        b=ZREy3sBR7dJ8fJeDiXt3deJpuuz19WEK8oTBqAwRyEOk6ky7RjVhQ/JYba9kp1UDsY
         7Mjx4zVIFOv59aPnGCCTAkYiGyQ2fNeFXxYdrVtKOo1qs7gPWzUfVd0cRy01Foz3uNjq
         od6CYXGhDgxkzPnJt1jO8rYrGQ67fRuMRHw4yPSArm1aJ7etsfJ3uLsaTRLmkwDKCisV
         E6EBhhtu8njArWoeq+s5d+rq79gj+KaSfrJ8MxzD2ESCWo3oelVAB+Nv5kYtF4TU68cR
         Hrw+tqpi+8FgKrb/NLNrZovEiaZ3nzHK2gK41aJohIKBUUyo/AX1QoN5kPjysoJoKy63
         ioqA==
X-Gm-Message-State: AO0yUKXZ0stLpT1LQuWLG7Fg1zew8zfUtBR3zHdQxY4oQqUHv9DzB6XX
	odTxEjJ4aU+asCoH93aQzV6Qil9cH7V3X2UtOOc=
X-Google-Smtp-Source: AK7set+GdpQkZvRck3sX6DqrZU+6C/wb0RTcQ9tapzMOkgKwb84TtZVCTcKq3dFfkpnYyJekTiBEd5RJMwq8IdTYdig=
X-Received: by 2002:a50:874e:0:b0:4fb:2593:846 with SMTP id
 14-20020a50874e000000b004fb25930846mr2512325edv.3.1678930485757; Wed, 15 Mar
 2023 18:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3f6a9d8ae850532b5ef864ef16327b0f7a669063.1678432753.git.vmalik@redhat.com>
 <202303160919.SGyfD0uE-lkp@intel.com>
In-Reply-To: <202303160919.SGyfD0uE-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 15 Mar 2023 18:34:34 -0700
Message-ID: <CAADnVQJ+-ThSUMzEgWu6OtkWB-bdqZKPiRxWUEbL5L=cPjeezg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v10 1/2] bpf: Fix attaching fentry/fexit/fmod_ret/lsm
 to modules
To: kernel test robot <lkp@intel.com>
Cc: Viktor Malik <vmalik@redhat.com>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 6:32=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Viktor,
>
> Thank you for the patch! Yet something to improve:

Argh. Comma is missing.
Viktor,
please send a fix asap.
