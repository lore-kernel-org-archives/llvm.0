Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E443214
	for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 17:27:56 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b8f549d36e8so8417156276.3
        for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682357275; x=1684949275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdA6Byrf0lwX48iKKvuKILJgKE3LwYes2nbzbUPvwjQ=;
        b=agMcbw5SWjFyUNOdq3N/KwNnq+uqHSf5o3sbylnzE5ky2sFKTCZSs+WFh2HzT+bNaH
         ZoFfdDq+rKPPYtIQI+umDFZzxOnH+MWAK1lxkD1bSXCaQbTIaRDBjEDFe91H7Clyp9DB
         rdQyoWU5D8EukOUTyc00eHJCNq3df/0yVGLfZD1Gjhf4CzODaHHgF9Ic4sQN/E8NJiQY
         XfSXEHTxmWoRAjOwog+uCm6QiushxVNXzd7QuHB/cElgrSFkLpcU18dLGTITWRl80Hhn
         eP401N7XdDccXWEp0NzzrN3An82kdM5T1cG7Ibi4G7xMoTFQTqz5mYP82XBm37wkoLck
         yY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682357275; x=1684949275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdA6Byrf0lwX48iKKvuKILJgKE3LwYes2nbzbUPvwjQ=;
        b=c4d9rra+t2DC/6xvnbd0iaq/yeuxdMbHMdNZRWmIlum7ElZUEBSS0PROKpCHLeE+dj
         IL8tT5ZU+7h+WUtGQJqC3n9z06A01RQSAy7F3GpzJllEyXH2TyJAevCH7ftkClQ//Tzz
         Z3gryB+2OU0sufjz1e1JTfLzx6Tg/zjJ+BVYcBxH2PDCkbZLuzDoFRWt0slwKtVGicvK
         YJ9ktLeGDc3BTk5/oUoMros8AZ0pNfdVhvKsi2DzV7YlVllc85gKOddk+jNh2T0lUCJo
         29aizj7h4xnzozqyl653KtwaFqIcHWMIDYeSuWcrG2NLRCUnaQvM+yQ7HAGs6nZf8VV0
         ZijQ==
X-Gm-Message-State: AAQBX9dMP1fpK02RziUIBfNl2faShtCszk2sYN+mPPA26pmt3zN76mey
	LxX63/Pv3dMEOoY3DaYnhP810JfV3xtPXN+m5A+09V9a4OhVow==
X-Google-Smtp-Source: AKy350asbRHC8PDsiNKQs25dnFEaXtgJXtPjtNM7+i463aoBFsKoTYo1Y2MFtqEoiWXRuZufmD63t5ux/BXRK0Udszg=
X-Received: by 2002:a0d:d5c2:0:b0:54f:b93f:759d with SMTP id
 x185-20020a0dd5c2000000b0054fb93f759dmr8545103ywd.43.1682357273559; Mon, 24
 Apr 2023 10:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221016182349.49308-1-masahiroy@kernel.org> <20230424162110.11082-1-lrh2000@pku.edu.cn>
In-Reply-To: <20230424162110.11082-1-lrh2000@pku.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Apr 2023 19:27:42 +0200
Message-ID: <CANiq72=Kb6ckhU8Ss9=Dg4Zn11Us+DLbKnNWAVaTb-nv7Y=ARA@mail.gmail.com>
Subject: Re: [PATCH] scripts: Remove ICC-related dead code
To: Ruihan Li <lrh2000@pku.edu.cn>
Cc: torvalds@linux-foundation.org, masahiroy@kernel.org, arnd@arndb.de, 
	bp@alien8.de, dave.hansen@linux.intel.com, devel@acpica.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	nathan@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	rafael@kernel.org, robert.moore@intel.com, terrelln@fb.com, 
	tglx@linutronix.de, trix@redhat.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 6:22=E2=80=AFPM Ruihan Li <lrh2000@pku.edu.cn> wrot=
e:
>
> Intel compiler support has already been completely removed in commit
> 95207db8166a ("Remove Intel compiler support"). However, it appears that
> there is still some ICC-related code in scripts/cc-version.sh. There is
> no harm in leaving the code as it is, but removing the dead code makes
> the codebase a bit cleaner.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
