Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C228341AC5
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 22:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757628477; cv=none; b=RGR7qbcg881r+N+kY9YyO+OpVyZFhEb35lYZEw/8MK5yPsBW4QBxvftCWzaQoJ8WjIpf7y/6T26Ywu1SmFE4gDUh3A2JAgK023wq9M99AfksYXUeapAmDULCZQyJSrmWyihn2MUaLKZZU6x581tzOumGoyMjVH4lU0eQ28PQ0Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757628477; c=relaxed/simple;
	bh=jtcnfarZA6UzrvRtmWR0Evc6ldU/VzjjNKluiCCXV3g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=giITvBeHDmbDENU4mV/CBwkMRzR2iWnOsFW/2mY/ES5PVW5u+iFzQOtBEAJRqA5jvfJxSr81hRnuAByoQy/Tl+iGkoTA2Q93JFJHIxzFxst3XM3efWNNpxsvmsT3wRrLBl8V6EBRy74NGYpEOBa+Q9QkrE04ygwKLZcN6isZRcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr9MwOBB; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr9MwOBB"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b523af71683so1043235a12.3
        for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 15:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757628475; x=1758233275; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PIzLX4YwMmt2w1/Or//9q2o4ZqfSWElSTB34sVpm3Zk=;
        b=Rr9MwOBBdyUN2A+7vikVw8c4JMi4FwxhYeIJ8Jr4Y37iXRXw2GgfKSdfGLp3yGoSwv
         ahS7lg3mStHqi88mP3xFxknQuReyyzM+HDsPtfWSJXZPuagMK8D5oUaIXn1w6x0bW/gU
         NXB2anTT4DG9TNN1pxq3GtFI/HlhjDsbztwcqNPk/P7179Zl45cZ1DLQXXcGI/+3ATQH
         q0bNnTDVtgX9t0TLVoIfOUqPfLJ+3F4fUOmoPy06kAVntAGEBHmXnZNhqQQllmrzyB7T
         FfSLBUnI4DkltYkWjCH5CjrltHRI/ro6/MMa1DM3dZ3a6WJZDOuyyQbJBucmUoN7Iigk
         zC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757628475; x=1758233275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PIzLX4YwMmt2w1/Or//9q2o4ZqfSWElSTB34sVpm3Zk=;
        b=SIruM5r4LrSx3N+QUkIPFwzT/5KKgr5zM7qvQkCyRtFrBJfGpn76qNnXI+j297iQvb
         ZHAaLUIqh+xRstI1ixB2X2e6DxJpSigaXVjZrkotjy/k4BWko0o21fnIw5f8KCOLD1+q
         DMT7X6biTqqy0FCcEdsWxGV2VgUOJ0f/Ic4IRbFdwp8iMU0ycLYZ0m1pi7nFKCFNAIx5
         eRjaVFwYDBTjj3j+W4y0sd/UNknR7yJ2kCQzM0ZEw0LhOqlc6E3v5J3OhV7WoXXMR+ag
         8XlWH0W4mBbp9+XD+h8fW1EixicQ1CvpKfmwBUBk7orJHjQ0iSuygpo/RE0KydgeLSer
         Qesw==
X-Forwarded-Encrypted: i=1; AJvYcCWKVWZ/81Fv+HjoN8JX8IuLrKSwanloIKx95rXiYUiAxpwpH2HwoFI8JSYz5JFD2uVvvkHk@lists.linux.dev
X-Gm-Message-State: AOJu0YyIkzxTO/PyCzXhXiZVFu4cn/le7mkyFlfm20Pl1AFtZiX8ok03
	1iPaht+S/bvpJRBdpR9GbbvipnnShdm5E7Y1EHQP6EJr7Hj9BhLn+C6r
X-Gm-Gg: ASbGnctx7tXoTHwf8kFmc9pi5YjpcVhUIvvpTekVt/1rAeT/AMgMejf/Guf/Pa9C+Xc
	DKCf4r8+deiDw7bYK9RM2dIIF2U869txKIoffE5eR5zT3+5QTAiqnRb408hyYak5tRdAaMPH//p
	c2F6xTHlXyDj7jHTjBKM841YD16/VnyORJq4MffYYQCqZSmRG++G96jg0yJa37M+F93FlBZIFEM
	rZCDb7dGHASrBS8ln1XCFeMBsMj2w7V8K2GhAc4U3Z5T9UUhLMnhvNEO0JJayFXMiJYMR1pgVw3
	drrUQqLH37lEmbyfJ2YJzw17Ep/WC7zh/ABOQluE3jARVz3K/Xw/fSceUO7g3lgHPMiEjyeO245
	Bws8wS1Io8RKkdu8ZWnc=
X-Google-Smtp-Source: AGHT+IGfIKtuAcKICp7ZxJp8lOEaeeLF1BaJMcTC3R/RXVkYiy5e+/ccc4815OulQS5TGLefpo1+Zw==
X-Received: by 2002:a05:6a20:3c8f:b0:248:7a71:c25 with SMTP id adf61e73a8af0-2602c71ab31mr890725637.50.1757628474841;
        Thu, 11 Sep 2025 15:07:54 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a69a8csm3148324b3a.44.2025.09.11.15.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 15:07:54 -0700 (PDT)
Message-ID: <6fd0e1fdf651f0728d1daf4fad3d6e4d4c11d221.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 09/10] bpf: disable and remove registers
 chain based liveness
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>, 	oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
 <martin.lau@linux.dev>, Kernel Team <kernel-team@fb.com>, Yonghong Song	
 <yonghong.song@linux.dev>
Date: Thu, 11 Sep 2025 15:07:51 -0700
In-Reply-To: <CAADnVQKGwghC=+V8u0tSPdkJ1f4usY5LeYUpxnJno=3xW8tYGg@mail.gmail.com>
References: <20250911010437.2779173-10-eddyz87@gmail.com>
	 <202509112112.wkWw6wJW-lkp@intel.com>
	 <c846a153010e40a52e98b8abe9db69f7d4cadd58.camel@gmail.com>
	 <CAADnVQKGwghC=+V8u0tSPdkJ1f4usY5LeYUpxnJno=3xW8tYGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-09-11 at 15:00 -0700, Alexei Starovoitov wrote:

[...]

> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -19297,9 +19297,12 @@ static int is_state_visited(struct bpf_verifie=
r_env *env, int insn_idx)
> >                          * the precision needs to be propagated back in
> >                          * the current state.
> >                          */
> > -                       if (is_jmp_point(env, env->insn_idx))
> > -                               err =3D err ? : push_jmp_history(env, c=
ur, 0, 0);
> > -                       err =3D err ? : propagate_precision(env, &sl->s=
tate, cur, NULL);
> > +                       if (is_jmp_point(env, env->insn_idx)) {
> > +                               err =3D push_jmp_history(env, cur, 0, 0=
);
> > +                               if (err)
> > +                                       return err;
> > +                       }
> > +                       err =3D propagate_precision(env, &sl->state, cu=
r, NULL);
>=20
> hmm. init err=3D0 instead and avoid explicit if (err)return err ?

Or like that, yes.
