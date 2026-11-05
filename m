Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793837167;
	b=dmw8q/Gh0K6yPgnbsQ9jwd9cVKA+cqB6auHWO7LGtUnW3KqveH/b2wUwlNkIGq/8mFHh
	 GeWhCRZWxzCEP+Sn0IHYp13O4WGGWDdkpaNfR3CP1VxuDsKAm1BvQj8iMiC7NGDMTnWBu
	 15kzcsoDLMxlrj2SYsGVJRUL1u2TLapSShatH2hAJQwixZzwxynVxov9fIeRjDiQ0F0E6
	 nwoystdPY52scO2CRw4PulMUGa5pJgzPjulbkwEq27lOHwhDofVGDlsdpW9pH9l1AqbEe
	 RhHK5jtq59gkQi8eNTfYVamnWQ2wjBdKc4oEOTPO1uTpK7gmfmucnJPeQT77qq7fd+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
	b=ruRYLR4InKAMXQ+ZfWuGwuUDyQVpzztl1hhaR9gWSZ1Mv6oLOocbgY8qFLpsHvE/u06f
	 V14uZYRL7lm0DvVRTSNUHPdoKrnHjKNNVEarpyy4T232XFrYY6PuyGAASgNdrDxQCI01M
	 OmWwcP2C9WcfKLWKCjOhPrwYJoPxeSI/wL9/DAFrzamY2Apeez7LYmGNYON//eLtEwKdL
	 ckZ/r9ma6OH5So+/+hz2jh04Lwqs6+Ig/zKvU54nrfAaEXsC51cgQccl78xEVyaq2Zm4e
	 MkIC14LZQnEtaQXliNLLqtLN4Nlln/oBf096l/xRdALykBtqusDPsmonUervx19RSvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CO3At2pl;
	arc=fail smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA6606A326
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 00:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6EA6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CO3At2pl
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40f29667e6so205720566b.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 16:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793837165; cv=none;
        d=google.com; s=arc-20260327;
        b=V6HFSAfIYWsJTKESmDtunwJWgBIKRli/MHf6TWLEqUbzDUzmTFcj9JxsBnzhnAttDi
         k/12TO9lncSQx5gxlFEeRxoiplyb508c0HNjujsoc31qr+3q9e5X3yPo8L3+uU8Vx40a
         nCbR8EpWXyTvO5vzXIhbdqAxx1qvnnAYtSBiL91JOBMXP1K4FT4K6EtJKBigV8/CNH9c
         lKvrgziztkJnysb8B3ISHImTpevx+AukJU8RkQv79Rk5zV+QPGXX2haJqIhThQqrXakG
         TiVQl5ccTGprl8DVQrJkSppGz3xjjj4K2oGEh5Wy0J7H8GuKVtLdcuKnkEsLhQ4x4UTU
         z9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        fh=Ry3OhSniKFN5X/B8XazbRXWa7yc2LKPLfFmkAeyv13A=;
        b=mF0jCC9mwjn2QnDd81UsQuUQq85Rey5l66Z8vu0B7UWZYRrKrZ0sfWN67XeDtxReqK
         7/mYwbrdr29/Fw+VG1sN3lSUQac0TlW80pjwEjaqV1UrqI7q29VlWiLmHOMEeZev5fK7
         lI4+wbrWbjgd7fDjD5Vaw3+r6wJs9fkFpmzzZJFg+cZFcsne/z04dyj/Rye/tmtQIE3E
         ljXrO8a78Tjux0tLA8F8hPPr1Q9mHPWVua/5adscxR2ADvQznC+i+aGUW0snFT7HYX9v
         hinWAToSshMRR4WQDX6dzULP5jKtcC/UJ3Thi1ecs7n8V1oefZ04ajXXcWbJGDEZhG6U
         58aQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793837165; x=1794441965; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=CO3At2pl2ZtVyOHXonC4LPA3VgZNjMQpS+vKvwt+I48TBxj9TI4mVWELMmeWf+fjNQ
         G6sHSmKG3rpLwLtmirXIWsK2ZYyjx0uc5Ap7L0e3Hcc45lMUKzVaCJQX4BY3YdqJD8qJ
         KoInGRVaZGlHe/f9KVlnc6Oez5F2MoI+gTc8TuU6b6JdIJqmCc/lN+HI8RL6hgrS8NrS
         RqkIfMtDQ9/cKdQj8HVcVqjgFfuBUsio/bap/upilqyTX/PiMgrzg/YHzpTbIU1C4NYx
         gN816fN5HTMkS7bXYAVrxDCNfvvNJH0KUWzjoPRTi9CqSqoqHa7Q9dV+KcjO+02ZIohU
         Rjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837165; x=1794441965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=AzlKEMoo3xgoDsbMXheDARI+9wJqDd/FBBw/pSVXoYjY72QY8XEs6b73r2kwVCKS89
         Zy5drTAvqFFDJLzl50M8LJbsrqiZxPYUWtf5j8TbSmgv0s5NoEsLgcd/C5eLF4FqdLlY
         jTxCj7prWjbC+K8N5lqrDrgf4jnCGyJrm+cghya5Wpb0AYL08jIKYMAuPm5H7hjCitTV
         qohX2/RNEAsULS1a/EuzcuGZgEu2LjQEn9hZFfUBVMqhc54UWjVvnxMweiecdR6z1jJ4
         FNMxY1x48QKkTx+sRq4uljbe+1uj2hZl1QGBbdjstcpeoiY3yTrvStZEkvhwWrVm08mZ
         pZAA==
X-Forwarded-Encrypted: i=1; AKwUvByFrx+tUjEO8COsUdrNfDeQ9gElPBqLm9krBNTrWZAY6tiMDk8p+QUVyAY5RKpw3olfI+Is@lists.linux.dev
X-Gm-Message-State: APuU4Z/5nZnA7DeE2yEdXBJJhSzh/LNZwmiBGf/qwvmwQh6ff52IXx8u
	rMjSXE5ZyRWltcKRK0TBeYhZh0D2/igIWANC6Ndj+JR6kZ7NIFIZlkkqT6GaFHGIvWlI5Iio5es
	KOfsep1C7Cy9bbUrqnC/4PP9lJp6Yp2GzPTmAz2nQ
X-Gm-Gg: AYBFou200kuVSQhzjhWCQSqPruxuqFU6LZi1GGBVnNcAeDYHnJvNj9TByOOaD1PdOfo
	biDD2Qh0LfvBRXAjDsZicdaKnR/8Wp6BQtfWqkf3GzygyBJi+J4Vsn9fIEfJSBtaSPXTuhJBRtQ
	zEE1LJG8HBqAZTIlCEryZGUcq+eldAsWLmdqytAmczXEIhW8g8Bemf8/G3mPtkbjp922+GBrEkk
	3WQDDrn1BTDq0GWlarRB1axOWhRqj+pKcMcFE3BVmRVI4aYOUvlmy4qMB5TMm+RDRxPnXS9G1AN
	6xmYVPmCw7dLr33HrrvwaW64QlNcBq0H/kXq97LHX5Mmjxeweeuk+E5b/3oTcGLIaIRNwRSYsKZ
	E3IM71ZUR76mBhhkQWlgAXv/J8xfxAmLIaVQAdQyKNYI83xNzl+lP/clzbCIoCv4qQPFY60s=
X-Received: by 2002:a17:907:3351:b0:c4c:b560:2a71 with SMTP id
 a640c23a62f3a-c4cb5603d9emr979541566b.36.1793837164883; Wed, 04 Nov 2026
 16:06:04 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin>
In-Reply-To: <20261104142307.431fc12f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 4 Nov 2026 16:05:52 -0800
X-Gm-Features: AclHuK8Z7yNuvzdyvQXTyXXmXbvszi-XVmOSWc_IPj379xX-z3zgWWYR8Kt4UgU
Message-ID: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 3 Nov 2026 17:14:26 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > Samuel Wu <wusamuel@google.com> wrote:
> > [...]
> > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > > would be different symbols at different addresses. Please correct m=
e
> > > > if I'm missing something here!
> > >
> > > Only that the user might really want one of the copies.
> > > Sometimes there is only the copy.
> >
> > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > pagination to cover these. A prefix query for "foo." also finds the
> > copies when plain foo does not exist (expanded on this in my reply to
> > Andrii's Oct 30 mail in this thread).
>
> I'm busy rebasing my patches - they got stamped all over :-(
> I should get a v3 that applies by the end of the week.
>
> I will add a 'prefix' variant for you.
> The 'next symbol matches' flag is exactly that (actually it is a
> this symbol is a duplicate to avoid issues at the start of the array).
> So in this case that application would always need to read
> the next symbol (by name).

Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
approach so the two series stay independent, but I can switch over
once your series lands, so there is only one search over the name
table.

> I think it might be more sensible (less pitfalls later on) to return
> the symbol number - not that of the next one.

What pitfalls were you anticipating? If the current symbol's position
is returned, userspace needs another ioctl() call and an -ENOENT
check, to learn that there are no more matches. Alternatively,
returning the next position means every call pays for a look-ahead,
which for an unfiltered query walks the module symbols even when
userspace only wants the first match.

Andrii, do you have a preference between the two?
