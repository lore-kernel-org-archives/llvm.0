Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB2B7F;
	Wed,  3 Aug 2022 06:03:40 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id tl27so11722283ejc.1;
        Tue, 02 Aug 2022 23:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yTj4TmBw1tO+s+/E622v1pc0c4D1v+OSObDkqpLLc1Q=;
        b=Kjtj2j7Rz3OIlku0tpUDJ/ObZMtg4OlvZ2wGAUwzDXRw/S20lSlIiGkgZfS4mBx3Iv
         WTN9C3cyOfi68EsojmWc3d6iz/tfws8SNd5trGJ+Sz/0VGh0PRY9UojGb5SJpHhSUuMJ
         k8Cvq3nKK69REeNEcVP+IKi45zM/f1nOsr0my6kTbBm1GtXtASmljWg2eShpGEkIWxFE
         BRcveCFRXNa/QKYZ0JR8YPGNvnObPPQL/e1Om9YLYocwPRcUY0tPFhJq0rLpnKSrgvpx
         Fe+CxNA35b45VtEdVkb2VI9wXuyXpsNN4P4h/t/jBsPxkvoCb1GWsbUvP2e6tMTaUX/M
         Y4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yTj4TmBw1tO+s+/E622v1pc0c4D1v+OSObDkqpLLc1Q=;
        b=sgdDrLw1VmMgWI6RlaP8J6mIn6u41cvqWaGnK5/ddlkTr1k0Mf+11pnHE8cZxRmTPv
         7xyP8fCGCL344ZlSGovZgx/nUiW4a1CtyfDz4OaQKjProk3MqrFBwXuc16heElxX/kns
         34WWfHhFT28vpGClmD9q3IkarkN0l7Cvvm4tdBlYfwvz+oiq1rizH4t5R5nI0bBl8lOE
         vG79VWXH4o4msQuq/Vbj6duJHYh5FCI72aMpZGVdA1Ueu3DQw4kTk/HxCoKzP5XwHjcx
         lamCiYCNrAqVUWB0bMSpWW5T5eoP8hwgSNPsvyNuIjBLZ+KITKbXC1vwLMKK/PRZY4fB
         WNDQ==
X-Gm-Message-State: AJIora+j2ZAR8hf58EFrH8Gnn0wqYwZYueWu8VhWcXWjNPPHPOdZYlga
	m7TagAJvwtgDcUqJqiwLpEsMIOocb8SZTdXQcJI=
X-Google-Smtp-Source: AGRyM1uCK81RAEqXiBmO2EIzhypQxUIlr239lYiNo/9nXBq0084bUhbDXRpBqWRalkCn3onW4J1LbdDavAsumgDm9uw=
X-Received: by 2002:a17:907:3e11:b0:72b:49d1:2054 with SMTP id
 hp17-20020a1709073e1100b0072b49d12054mr19202140ejc.78.1659506618976; Tue, 02
 Aug 2022 23:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANX2M5Y+98u3R9zATF_VQnxCGzmg59O1sNnTc1sH-wgWFJbLrQ@mail.gmail.com>
In-Reply-To: <CANX2M5Y+98u3R9zATF_VQnxCGzmg59O1sNnTc1sH-wgWFJbLrQ@mail.gmail.com>
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Tue, 2 Aug 2022 23:03:27 -0700
Message-ID: <CANX2M5ZEFGToH42rW+yndG59Uebcj-Eiv21Q2ykvHj=eVjpn+w@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in ntfs_get_ea
To: almaz.alexandrovich@paragon-software.com, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: syzkaller@googlegroups.com, fleischermarius@googlemail.com, 
	its.priyanka.bose@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 22, 2022 at 5:51 PM Dipanjan Das
<mail.dipanjan.das@gmail.com> wrote:
>
> Hi,
>
> We would like to report the following bug which has been found by our
> modified version of syzkaller.
>
> ======================================================
> description: KASAN: slab-out-of-bounds Read in ntfs_get_ea
> affected file: fs/ntfs3/xattr.c
> kernel version: 5.19-rc6
> kernel commit: 32346491ddf24599decca06190ebca03ff9de7f8
> git tree: upstream
> kernel config: https://syzkaller.appspot.com/text?tag=KernelConfig&x=cd73026ceaed1402
> crash reproducer: attached
> ======================================================

Here is our initial analysis and findings regarding this crash (when
we run the repro attached to our original report):
In `fs/ntfs3/xattr.c`, the memory size `size` allocated to hold all
the extended attributes is `60` bytes which is pointed to by `ea_all`
in `ntfs_get_ea`. `find_ea`  iterates over the `ea_all` by adding an
`offset` to current `ea` address to find a matching `ea`. The offset
is calculated either using the size of the extended attribute in
`ea->size` or using struct size of the `ea`, if `ea->size` is 0. The
loop terminates if (1) one matched extended attribute `ea` is found or
(2)  The calculated offset is greater than `size`.

In this case, at one point the calculated `offset` becomes `56` which
does not satisfy any of the terminating conditions and therefore it
still attempts to find the next `ea`. In order to do that, it
calculates the size of the current `ea`. Since current `ea->size` is
0, struct size of the current `ea` is used. During that calculation,
the field value `ea->name` is dereferenced to calculate the size
occupied by that field and the address of  `ea->name` falls beyond the
`60` byte slab range. Hence, the slab out of bound occurs.

Please let us know if this helps, or we need to dig in further.

-- 
Thanks and Regards,

Dipanjan
