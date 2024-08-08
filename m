Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF4D15D5A1
	for <llvm@lists.linux.dev>; Thu,  8 Aug 2024 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723153913; cv=none; b=irkgr+EHqMsCDTBFlmYEHEV3+4DflGzdgqvV0mo0gzofJL3S8vM9WXe4nXwDZc7mEe62BZQC8DoAaLJ9EuADOlYt7hREafsDJMQ48kjwmsnE2t1gr/P1GuqvGFI40Er/BwkWu7oIASBBFxMnSFxHLSr2b6ByajQdGTKrExdXdBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723153913; c=relaxed/simple;
	bh=DTz30EgiQatv3b3Mf5x670oIHDaDHPcPkrLDKRckk8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7SAvRB9YPOtOvBtxSQQdr6TjVWwDQPYqxiiTNvJAluCe0xg5MPdecrWogUEB1Eckw+cal3H9h5C6IKgdERAgUD9jUGL2hSWd02SRDscyHYh5lVTt/AlkjvEK0Kraj12q+/qGGmioc+9LXKOro665TVd54EySbhnnPwLLXoA5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpLgBRC9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpLgBRC9"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530e2548dfdso1499260e87.1
        for <llvm@lists.linux.dev>; Thu, 08 Aug 2024 14:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723153910; x=1723758710; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTilJSTMzzmTUfM8PwyjqnLeW2jPuc+7Tc/WpwcfYso=;
        b=LpLgBRC9RJ4P2bI38XIICDub8lopReSFZNc9KHR5tESHQyWgghj+sGd9ZCu1eoZgdX
         ZdP/tir1WIaXffju569RCPzk2VW9bb+AeQuPI9MbjY59G61Q5eD9K/xy2wwThmTcx552
         ojUUG/KNrB5Jwk+F7DKPshE4fzsOH5XX0daP8FJ8OxWTbsaBK3BQikV50KoBJz6TCH9b
         703s/gCp9NnDZw+oovcVjZaDNipQtkaRZ1tb4xcEJ68riqJK0CXzoRtuxV8JOtlgqi1y
         DZep8ov+Jiph2rOdM7YNvVmP2r6ELtufi+ZsR33sz76Y63AovVnOmtIn4iuvB7yr57Jy
         NI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723153910; x=1723758710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTilJSTMzzmTUfM8PwyjqnLeW2jPuc+7Tc/WpwcfYso=;
        b=Lv0SPMMGGYIvlNiiVfSuYoT4+huLNuouz6Cvj6WhUWFhfkn6r8bN2FA6vHTskXew18
         yD9atKE+M26ZSnCfkOrnsR7gBxE0rAi7g2MvcQr++hqBqAq2K572d3+nv/DoneeYCEqw
         kPNGn/JsDB0XMQb7QF3nm2KF//QnayaMS1gQCxlLGqWG3J4TIzOPJvEWrkV0CR2abjyZ
         /HXZlJoNWTp1OsKi8V/RK4BGUZDQGLTbXeJEwuLoQueyG/yyX85UwLrfR1L+O/jHXv2h
         5/NxO5fKXNugpZf0pDWQe9pinKLKgUb18zs6mEOH9HzZ4oii7dSz4tKtSFMda8njZhV9
         Jn6A==
X-Forwarded-Encrypted: i=1; AJvYcCVrYkvXNPzRZgQW2IGlmAG2rWrmTu9nvrTC5HBYik36EpfYaMueXJ5wUEiSAAzzrdPZ/Jx43jbjP95s3Q4bHuL6aDwaJw==
X-Gm-Message-State: AOJu0Yw8JBwk+nJQL2lWeuwDP3/bo3I+DhH/CloFFOL0assUibSKssop
	Bz4Zx/FdQiBmWPBbOPuWMACP2BJQpT2SUeOHp6FuIe0NFkN03BvBZLKpR8Il1FMT3aGrsuuZa75
	O7MU+bmupd0Fw1OJb2sLgPQOCODk=
X-Google-Smtp-Source: AGHT+IGES8fNHsGvpYv7uRV9s1I4pkbSiW25z5WmM1/EEFB1wRmanyCXIXI8O8RexuT7mqGHIaX1FSuWqO2mBT4epPY=
X-Received: by 2002:a05:6512:15aa:b0:52e:987f:cfe4 with SMTP id
 2adb3069b0e04-530e5876b8fmr2151699e87.30.1723153909723; Thu, 08 Aug 2024
 14:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com>
In-Reply-To: <20240808122331.342473-1-suhui@nfschina.com>
From: Steve French <smfrench@gmail.com>
Date: Thu, 8 Aug 2024 16:51:37 -0500
Message-ID: <CAH2r5mshFXCMO38WMZP0NzrugKZn1QexLSH+2aEMcZnB2S0+zA@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in cifs_free_subrequest()
To: Su Hui <suhui@nfschina.com>
Cc: pc@manguebit.com, ronniesahlberg@gmail.com, sprasad@microsoft.com, 
	tom@talpey.com, bharathsm@microsoft.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tentatively merged into cifs-2.6.git pending review/testing

Did minor update to add Cc: stable

On Thu, Aug 8, 2024 at 7:26=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Clang static checker (scan-build) warning:
>         cifsglob.h:line 890, column 3
>         Access to field 'ops' results in a dereference of a null pointer.
>
> Commit 519be989717c ("cifs: Add a tracepoint to track credits involved in
> R/W requests") adds a check for 'rdata->server', and let clang throw this
> warning about NULL dereference.
>
> When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' happens,
> add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> This will cause NULL dereference problem. Add a check for 'rdata->server'
> to avoid NULL dereference.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  fs/smb/client/file.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index b2405dd4d4d4..45459af5044d 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -315,7 +315,7 @@ static void cifs_free_subrequest(struct netfs_io_subr=
equest *subreq)
>  #endif
>         }
>
> -       if (rdata->credits.value !=3D 0)
> +       if (rdata->credits.value !=3D 0) {
>                 trace_smb3_rw_credits(rdata->rreq->debug_id,
>                                       rdata->subreq.debug_index,
>                                       rdata->credits.value,
> @@ -323,8 +323,12 @@ static void cifs_free_subrequest(struct netfs_io_sub=
request *subreq)
>                                       rdata->server ? rdata->server->in_f=
light : 0,
>                                       -rdata->credits.value,
>                                       cifs_trace_rw_credits_free_subreq);
> +               if (rdata->server)
> +                       add_credits_and_wake_if(rdata->server, &rdata->cr=
edits, 0);
> +               else
> +                       rdata->credits.value =3D 0;
> +       }
>
> -       add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
>         if (rdata->have_xid)
>                 free_xid(rdata->xid);
>  }
> --
> 2.30.2
>
>


--=20
Thanks,

Steve
