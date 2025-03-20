Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C21E3772
	for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742492894; cv=none; b=F+Y/dLoTQZHPaATe8OVJfqfwpqnjyK9iTZTAsNGbZ6vlvwDxDFE+1RgBtA9Umcv6nmAvb3SCS05eTqbX4nHNrgC9fUSRJBZ+gHGl/XzwY5ed5qZ+EHTHcIcl8Gp8r94Cr97MLJwZowRb6MWxA4UB7+xw+b4Vhoot6c3orXtOL3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742492894; c=relaxed/simple;
	bh=Ysmqv3SccazZxWdH2a52RZ23xFZ4L102c7g3MlP9WuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxmo21SgVR9FvvZxCIIUYRaLAoeTw2wIwCx5FtKPbgCqaHLNxJL99tYRvBoroNH7y7Ve+XbMYmV+DK5NyQcJcpPLLFt1q5N8k2aYiFnau7CZGTPV2Py8B8csZNxpiei0mEO2+547oZevJ/DPKhCvfsxo9XDL/JyOdS3UQqicsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCvB25hP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCvB25hP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913d45a148so922480f8f.3
        for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742492891; x=1743097691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwSKT5FP1BR6N00hLzmPIGh88EZ/x1So/4f2vrksFwI=;
        b=fCvB25hPdBJ6sDIJD6zKx7PZ/UhlgZnp13tWUW0D95AXsugv3jOqeQmf9EmW8yXj59
         U1bCdOa46d/1BGLO4hBqyTQ8Sa/syabYI7sllQ0C5w+VikUAVuhYMUqnabJ/kC2W7V4i
         jLHzigVIld/wwo+ZYwlNfH6C9bT7yLLQHXUsVpRXbc41vmZe/JGQz9Dm0ckSwLAxCI++
         wNvkAdVf80VirtFYaG1Pak7wpK2xL0CgQFzV1Po16wUIarPlWE56kXuIMwbUVDtmv950
         MyBT0K32mqX+rK0je9RZ9M2c7cLFZfaUXyFnRGVLRIq4zdZxWhrzSYCaM6+rEHqsz4mu
         0e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492891; x=1743097691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwSKT5FP1BR6N00hLzmPIGh88EZ/x1So/4f2vrksFwI=;
        b=w78SyK0PWHlghcwov4nl10soQntXa5sX+uQgbMrAgc6aVpAXpQYeIHpbH7zDImHO3N
         RXLJOEbTdv3dJ73Is/A5ab4rna74x3P+1PGW6Xul7130Ag0YX+lQ7DXIISgsa8+ZLpsS
         p+n88g7ZOBmkJ5O2ckQw6Uy7WiCZdddtbymbrwEHr4grUaqn0j+AflGHLQD9FTUj6Y0e
         qDLc8ubI5MwF9GBOYarpLGNsPdbp1FkebuPKyQZ4ldy2huHCcKxAetkNimMK5IG+Dk+n
         4Bl5Uey51n8JOBzpT6oHjhNlCEGMFIn0UAYmzTePm/39cQcgAYw+ejDilkl2HgPUjULb
         2emQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgGSt7VtKX3BPPr6MHTvJvqS/lqz0wqlfwKWVnsddxEDNwk8AJh/YJ9+vqDKjnJ7W/xnJi@lists.linux.dev
X-Gm-Message-State: AOJu0YxBtTGucaToloShFrUAjDdGUl3UspW9/PK1lOgBboBohhmvbdJD
	Fr5oASt6w7gYLv490+s40Q26tr5S2TKSgV/qI3TyRzRR78gFJdVCZBIzYCRQSJUuSAL9ZMhUvFU
	gvym/VnXbHMF2XREG05BN2pkcrCw=
X-Gm-Gg: ASbGncs5JLz4RrOCFLzNIJ/bBhSQ8aRTwB5NEauo5QPIAAk+EEig0WMK1LCFp0oaNK2
	hWs+D53GXjGhNHrQxF9GR/0qBmWaYH3HSQ00oQprAGFCP1K4KC/JeanbcUp2s03POQFm2rA0cCB
	CzDuhb/Iqzua9b9Jlgjg1hNKVnp63f08k7H/iuyw==
X-Google-Smtp-Source: AGHT+IGY+bH5kQRAbmlh5W5EFC6lZXos4pQiYiEQaNmqvfQYpGa+lCoRdxjQCkMYgzW1X4djrC0Ewfw/7HM2vnOZAAE=
X-Received: by 2002:a05:6000:178c:b0:391:47f2:8d90 with SMTP id
 ffacd0b85a97d-3997f9017e3mr432989f8f.20.1742492890311; Thu, 20 Mar 2025
 10:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <383482f87ad4f68690021e0cc75df8143b6babe2.1739866028.git.maciej.wieczor-retman@intel.com>
 <CAPAsAGxDRv_uFeMYu9TwhBVWHCCtkSxoWY4xmFB_vowMbi8raw@mail.gmail.com>
In-Reply-To: <CAPAsAGxDRv_uFeMYu9TwhBVWHCCtkSxoWY4xmFB_vowMbi8raw@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Mar 2025 18:47:59 +0100
X-Gm-Features: AQ5f1JqHDM1qyWMQ9k-CyIbid1-RFpNXLnQroNsDKT1dsMHC48onaeej4RSJngs
Message-ID: <CA+fCnZdZpiu+guJjE20f8kwzwoPkx4X=JveQpeU38USEvFyZ7g@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] mm: Pcpu chunk address tag reset
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, kees@kernel.org, 
	julian.stecklina@cyberus-technology.de, kevinloughlin@google.com, 
	peterz@infradead.org, tglx@linutronix.de, justinstitt@google.com, 
	catalin.marinas@arm.com, wangkefeng.wang@huawei.com, bhe@redhat.com, 
	kirill.shutemov@linux.intel.com, will@kernel.org, ardb@kernel.org, 
	jason.andryuk@amd.com, dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	ndesaulniers@google.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 6:40=E2=80=AFPM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
>
> On Tue, Feb 18, 2025 at 9:19=E2=80=AFAM Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com> wrote:
> >
> > The problem presented here is related to NUMA systems and tag-based
> > KASAN mode. Getting to it can be explained in the following points:
> >
> >         1. A new chunk is created with pcpu_create_chunk() and
> >            vm_structs are allocated. On systems with one NUMA node only
> >            one is allocated, but with more NUMA nodes at least a second
> >            one will be allocated too.
> >
> >         2. chunk->base_addr is assigned the modified value of
> >            vms[0]->addr and thus inherits the tag of this allocated
> >            structure.
> >
> >         3. In pcpu_alloc() for each possible cpu pcpu_chunk_addr() is
> >            executed which calculates per cpu pointers that correspond t=
o
> >            the vms structure addresses. The calculations are based on
> >            adding an offset from a table to chunk->base_addr.
> >
> > Here the problem presents itself since for addresses based on vms[1] an=
d
> > up, the tag will be different than the ones based on vms[0] (base_addr)=
.
> > The tag mismatch happens and an error is reported.
> >
> > Reset the base_addr tag, since it will disable tag checks for pointers
> > derived arithmetically from base_addr that would inherit its tag.
> >
> > Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> > ---
> >  mm/percpu-vm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
> > index cd69caf6aa8d..e13750d804f7 100644
> > --- a/mm/percpu-vm.c
> > +++ b/mm/percpu-vm.c
> > @@ -347,7 +347,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t g=
fp)
> >         }
> >
> >         chunk->data =3D vms;
> > -       chunk->base_addr =3D vms[0]->addr - pcpu_group_offsets[0];
> > +       chunk->base_addr =3D kasan_reset_tag(vms[0]->addr) - pcpu_group=
_offsets[0];
>
> This looks like a generic tags mode bug. I mean that arm64 is also
> affected by this.
> I assume it just wasn't noticed before because arm64 with multiple
> NUMAs are much less common.
>
> With this change tag-mode KASAN won't be able to catch bugus accesses
> to pcpu areas.
> I'm thinking it would be better to fix this on the pcpu_get_vm_areas()
> area side by replacing
> this
>     for (area =3D 0; area < nr_vms; area++)
>         vms[area]->addr =3D kasan_unpoison_vmalloc(vms[area]->addr,
>                                              vms[area]->size,
> KASAN_VMALLOC_PROT_NORMAL);
>
> with something like
>     kasan_unpoison_vmap_areas(vms, nr_vms);
> which will unpoison all areas using the same tag.
>
> Thoughts?

Just a side note: KASAN doesn't have proper handling of the percpu
areas anyway, I even had to remove a related test; see [1] and [2]. So
I think for now we can go with the simplest/consistent solution that
prevents false-positives, whichever that solution is.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D215019
[2] https://bugzilla.kernel.org/show_bug.cgi?id=3D215758
