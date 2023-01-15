Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4841366;
	Sun, 15 Jan 2023 12:53:10 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-15ebfdf69adso9369115fac.0;
        Sun, 15 Jan 2023 04:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuFC+CU68Zm4Gv/Jgl+OAWcmLe3MlLeYnjNYVoXEMK4=;
        b=NwnsAAenWGqe6WqK7i/+6ZzKNGUroS90qk/AdhfXlro9MiXj6YFrLQ4GP9I7NvNQwV
         5ezzb/GIJHd+Ilzyas3t5ISdmr4K4FtkofJyw4Lr9cRCxag6ceHmSYf8pO4vqUiN0WHU
         O6r8BuXKhCHJyIB6qOy1W62Rr7hDM5CUt0mWjhrrwQf0NqYaVsg31uaRKG+mSKHnkYtz
         xZ80f9R7wL4sGXx+WwE6bH7To8QtdIhqiyjTnzKKStdh7Rq1MKScwge8Mm0V7WYUqm8C
         9mkekS4CROSUUrxElGz8Vl67eSE09vg5L3tgh/ruGe+40bdHPBy0HLcj0S6F9Cg15kEv
         ksIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuFC+CU68Zm4Gv/Jgl+OAWcmLe3MlLeYnjNYVoXEMK4=;
        b=hC6dixRoQSTCBWw8BkRXtZDnCsOFPUeaBVlBkAD+/VDfNGuJHaaYrdqmG5XXbQqEa2
         9G4KnwMptMFLxMN07JfVprMm9uKMAOBqbsq+tCVenmZxLn/ZwTY0526F47A4pPh3RoDG
         fCpoleK759LuL6bqo3uqRZolTIznGy0PFiuD+JLQNl9uT47j7nytKjYdU76GO+NbGhV8
         SbDzdtjcwIa/YQPD4V/X97yBqijmhPXxe2gNeOKn3Z+cf+/hcb0Fr3czIYQPTFTauxz7
         0Hcenp5CWKxHdvCFvAXdnqLOF9R+6nAXpoFiGen499fWr1e9X0r1xIXSd0l9r8Y78KEY
         JqBA==
X-Gm-Message-State: AFqh2kpg0k9pXmHOK4oh6ind5wXufW8XmHbxb0ec4aTUPP/TF2bWwqgo
	REiSyxGZXOmHRvvOfFyOY8lmZdui8lj376r4s8s=
X-Google-Smtp-Source: AMrXdXu35iozYlLRuKTTZCPk/rNPtl+u9bT910Vge89r7gjmuVCArOSnjt9SAzUQE6FDc4slCEzv9NWp6I9Jygg8NSE=
X-Received: by 2002:a05:6870:b291:b0:15e:db95:923f with SMTP id
 c17-20020a056870b29100b0015edb95923fmr797032oao.144.1673787189666; Sun, 15
 Jan 2023 04:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301150959.RAvfuBjG-lkp@intel.com> <aa73cfb8-99ed-20b4-071c-9858399aee0a@arinc9.com>
In-Reply-To: <aa73cfb8-99ed-20b4-071c-9858399aee0a@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 15 Jan 2023 13:52:58 +0100
Message-ID: <CAMhs-H_fykbcZjSQ0LKOmtWMLjekDgUHsJjNNqSvYvbY=wbkHQ@mail.gmail.com>
Subject: Re: [stable:linux-5.15.y 1642/9999] ERROR: Input tree has errors,
 aborting (use -f to force output)
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 10:05 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> Sergio, this issue hasn't seem to gone away. If you haven't sent the
> patch you mentioned here [1], I think Greg taking your upstream commit
> [2] to 5.15.y tree would be the easiest solution.
>
> [1]:
> https://lore.kernel.org/all/CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1mO+R=
xW+J8Q@mail.gmail.com/
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commi=
t/drivers/staging/mt7621-dts/mt7621.dtsi?id=3Dce835dbd04d7b24f9fd50d9a9c59b=
e46304aaa8a

I forgot I sent [2] at some point :). Yes, taking directly that patch
sounds easier.

Thanks,
    Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7
