Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A83D6A
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 19:04:20 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id c10so857386ljr.9
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=76YOh3whmbn2kqx1NwBv+Kz6cPFzAMtnxeUYyfGd/q8=;
        b=OBKQaFy2RxcRVMpclPmkX40fNiFA9xZ1M06FDambm/VZj3ozimFF9yfzH/IPJFXzHa
         qPjqXTszFuUqE8TXV1lXww3Z667n79ql/oVQlDLn/oPHQ1q/MexRIVFEQUMJkqybd5yQ
         coR1wSQC3lcRhRR4h+/kGuDvBV++mr9JoSg5cN8MQEDDTqmKmqhx2F5cUR8utIGnHpPd
         kmum6m1HYQZH2kpVGKNMISBRkNbXw++ofNJuZD/jMGHUPGgRC7pUf8Ab3eN89o28jljd
         u57aRQ73nEt0EatfpZNV56RywMxL2P8tNMiOUBwvv1qfch/8IBOiO6cKTMbJlUsm+71L
         78sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=76YOh3whmbn2kqx1NwBv+Kz6cPFzAMtnxeUYyfGd/q8=;
        b=VcTy68Zm3WDXKMKwlKjCb6nKCijyx5Os8eEh4G09NvS2hZ0kdbIj3aR+nNhQ5ULVeZ
         MUxqqgxTl611em0YQC7RZZH8Pqz5ymikHTODKuPMz4y2o02DACe7aGEsFdR8ea/VUf/B
         0ravjlN/hVcu0MKwI984pd0sp1oVZj0X9JA7SsyXE2VLu3v7hvaddvS2/OiKuxVtfVf0
         fSyc+hpfmhQLhmU87fUDZMm5kvtRnkkGKyIMQwslBnsWwut21wilSkjuLR5pNS4pjxC2
         9+Qp3lVJ/YKaWF/jE4tLvuHuFjBXvgXfz56lbCbrSwqGJJVWAp6cJMrAA41G4JnHxDNb
         teuw==
X-Gm-Message-State: AOAM533fhbEQskqWC3QSRyqEkcZKZBHVU+pIs7SxqGZ97eFddWE+hqV4
	oD6yhcF0EU83TwXdTgKfqq4hokrlwP+GjzA76ooz1Q==
X-Google-Smtp-Source: ABdhPJwh4DkU47MNBi0jwQYcYgp6ASpJqNbuKqJzALTbNGbz8cXoRGuLMjThUw0rnBxNBoUoQBdM0fjAD/6dT0KFPOY=
X-Received: by 2002:a2e:9206:0:b0:244:c5e5:977c with SMTP id
 k6-20020a2e9206000000b00244c5e5977cmr2981200ljg.339.1645124657897; Thu, 17
 Feb 2022 11:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com> <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
In-Reply-To: <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Feb 2022 11:04:05 -0800
Message-ID: <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>, Tom Rix <trix@redhat.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	John Clements <john.clements@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
	"Chai, Thomas" <YiPeng.Chai@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>, 
	Dennis Li <Dennis.Li@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>, Nirmoy Das <nirmoy.das@amd.com>, 
	llvm@lists.linux.dev, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 8:16 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Applied.  Thanks!
>
> Alex

Alex,
Has AMD been able to set up clang builds, yet?

-- 
Thanks,
~Nick Desaulniers
