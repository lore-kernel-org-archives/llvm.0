Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652799;
	b=dvNfArrHmhvtrE345I0Q/J5H1TPxqORizv9TCpS5Iih1MaOKVDtr32TsnS400GO46ZMV
	 D3YnUcekJ9Gv/GVy0vbACawVA5duxzHM7buweoY9yPXRl8rKSPbqk5UIr8/Y2p3yZhvl7
	 K3U9E9wZoAB4MJiZFWsf1JkRtQcg3gsFWNXwodX6gtUeibdDlCODAOxUNoxIJuJIt8Gj1
	 t69TZA028fYeP9ThGyc7qLHbM9ZlMMlxa36iVFP7x45vvEyqixh8cuy7nF3jKGCSBq+4G
	 jBFFVzP6wb4YWwV5+2WvLmmbQF8HdyAejn6Sy1XVch3Qrf8j+QzHUjUzjwhFi5zWEmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652799;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=2+O8TNSQYbNF+r1yZJCwbO3djiLkG+FSfMPKky0z1yunHtsKrGr6z/F25JCMxJ8TDXTc
	 Ej8AgfkDPYvRHcXD1G/W3zF2MyXZ4rnJ/jI3Vkp/E5etyYa6MBK5KGSEZRZFJ74O8zt2+
	 JkpvxaG/8n8CiRuPxCvAMMGdyjbkTZGhWtPV4rni3WkdG2fR3tarptiSiYtUEypd2frhE
	 ZmaW2HAvd3vd5hKY6manBzOCPyLxjB2lduQQNwplI97k69nN4KetFUSciiLzadSOWJU0p
	 6/0soGYHcIC0vknWJ0tVnyQF53ch+96KiGUVjVxquasnMyTQXoQ//hmu7QfnIAxKfyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C56C606A33A
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 20:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C56C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793652792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=JrjqNRqP10lz+xwTaT1N5hOMraQMewbNcL6ZPtYs/6qBeMDZq5lyggz1hz5TUE2wvCqKwM
	IXQbQRbVn/7mLpXXty1C0A86MwLFP717upzSrzHF5Nt1PiF43MqFrw00/Vf94oFs2+EMGE
	o+EsfhfOm9/h5ijPwHR98WSryq3gxtk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-rbjR_SZNNO2ujaQnAh5eOA-1; Mon, 02 Nov 2026 15:53:09 -0500
X-MC-Unique: rbjR_SZNNO2ujaQnAh5eOA-1
X-Mimecast-MFC-AGG-ID: rbjR_SZNNO2ujaQnAh5eOA_1793652788
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab3061668eso242251fa.1
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 12:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652788; x=1794257588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=pEip6xjx3Bryhdq5Dz+MLyPi+De+yW0TmV1iOVTIUkOiUkPaiUieT7vpUlS+JCefQz
         qewKMr/9KPzh6mNa9wvt8JlE2AzA5iZ+eYTwJNK74/eb+j0Wi2fCqBT4qv83CrtPyQLy
         LKashbiOxRkZXIwtDPfdfoNa7N/c2tf+oUtBhXgX9U+KXkCmBrBoLOocQEsgO9pSjNax
         KTySRD6lxk6w/SbRQBwlbU+MYp1KO7+r5ek/kX7W7QwLtFhvnbDJLvVyssk3Wdo4XPm0
         Q5FxHr0T6GKILvZ9jypAdujjQZipwAkFQsW5RxUddxcPJ3LrhfKPWwsuZqmZ6LLlVMCo
         moUQ==
X-Forwarded-Encrypted: i=1; AKwUvByTVSCGBqdeDyH6oU5ejeEqKF485TVkv9r8jjJpxKADxvmGEWyXE5JeA7O8scoXlsJt12r7@lists.linux.dev
X-Gm-Message-State: APuU4Z/ptJYc762rOiwFhvSq6z2Los3eHr26Fb7RLQ1OHxsN53Mr2fNy
	45lEeRwSxFsViicioYVDH5xfgh1LcYuICN7wbXSqEnI8M0+r2xMiIxbP8Rh09hDqRne/N3rTpjk
	Gn+78IHOy2rNXgdWJvw5UjyCeZ/1Ptgpuzw4vqdGIAZB1pq81vEJ8qUQuajn6X87fZVc1jdsRk9
	BnU537/LgmrhMUctePynFBSzWa3viqgg==
X-Gm-Gg: AYBFou0wBQS5D2EuoMWgNu0yUyWEVNqBipg9Xv2eFa56XWfwPGCF2ME7/3yyLjqErq+
	5/pXHSPd7sVocwyEs69u2IFwiapVP4z0AJ+ZswPFgs+IcEaM2oATkg6x0Vpk1FDvnyvcXP2DiIQ
	Rdg+6JBB9IIAowiF7E71t3Z6mdtviGAb3V17hMVlTnM7zZsKwCs67Uoces
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id 38308e7fff4ca-3acb7aa83b1mr20499191fa.13.1793652788263;
        Mon, 02 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3acb7aa83b1mr20499011fa.13.1793652787872; Mon, 02 Nov 2026
 12:53:07 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-6-irogers@google.com>
In-Reply-To: <20261027223847.652884-6-irogers@google.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:52:55 -0500
X-Gm-Features: AclHuK8pGzNf4aGPekLa6NQcs521xOugw8djA3E8ZMCjZ7yn89XzG5j_wIaQNFk
Message-ID: <CAK-6q+j-MS_5St04YFU11LG_Cjf1jOuS3q33qk_iK=7TE-iuBg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dlm: Free dlm_ls in kobject release callback
To: Ian Rogers <irogers@google.com>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, David Teigland <teigland@redhat.com>, 
	Greg Kroah-Hartman <gregkh@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r7ysYGOHpSWm1i8SvephQdPPJidQ8pSWTwINx_-oVg0_1793652788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2026 at 6:39=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
> .release callback and dlm freed the lockspace structure directly via
> kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=3Dy, freeing ls before the
> delayed kobject release runs causes a use-after-free, and unloading the
> module while the delayed release is pending results in an instruction
> page fault.
>
> Add a completion ls_kobj_done and dlm_ls_release() to complete it when
> the last kobject reference is dropped, waiting for it in free_lockspace()
> before kfree(ls) and in the new_lockspace() error path before module_put(=
).
> Also delete the kobject via kobject_del() before stopping dlm_recoverd
> to close the window where concurrent sysfs writes could wake the stopped
> recovery task.
>
> Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
> Signed-off-by: Ian Rogers <irogers@google.com>

A somewhat "big change" for just a debug functionality. Althrough I
agree we shout call "kobject_del()" early to avoid additional sysfs
changes during removal.

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks.

- Alex

