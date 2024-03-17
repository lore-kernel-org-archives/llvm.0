Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4B4EAC5
	for <llvm@lists.linux.dev>; Sun, 17 Mar 2024 05:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710654476; cv=none; b=g4GrPnLGVF1UKvEEzunjyOCArlT8HTMZwPwHZh9fBoKwKUSKdVxIh3tQptcGFG/G9tBftdH63V9B5My0L4JLI+ETMCXnuYMp2FsK5dGqJuszJSW0zvy2NCrjfUx52BYBxB2xucDfET7P7JGYWVufiic9kTiXUDO1M+j+LOSr8G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710654476; c=relaxed/simple;
	bh=jCwVDtdjVLnS0p3Xc6iBZtal0EfLjsLMmpXpfH0mMsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWY35xhf+luC217Qk31KlhJj51YpbIO193DtGfkIM8T8iMgiShrliR9ZvNKwv/CNtaJQ5aQd8dSq5BkE49C4q7DdxEzeCedCaMEw9FiWlrUbhwv99ybUZQv8VXGhUbyENo21wORJa/xnctYhGj/oAjJEtEDCAYKQOxMinuRy6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klpuFFkH; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klpuFFkH"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42a029c8e76so25286101cf.2
        for <llvm@lists.linux.dev>; Sat, 16 Mar 2024 22:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710654473; x=1711259273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjI0CmTAb9rBKNzvuDpGMzLCdPan9spH7TYPxSq//7M=;
        b=klpuFFkHk1R5E+iaI+mmbPyoYWdRdXFACalOTvA2iqB53RY3UoNhg7olNqLhsTst0e
         bVbI+ey9aRAeyxkqHRYoeJM8dPpRveyk4Zw1nFomJwhlA0atk5l72i9b3xcjFCfI6eWF
         CAf57U/77REW/pJSzPglC6DxmYuymDQQvGXmR5kbvoFxgmqB46IHYboj5KhBPyll0Jr6
         i8OQCrDkQvgb3z3x8M0PPuUGapBYwZkmMl8KwsWBd4DrVVSx3CO65NpsniqfnC9OGjHs
         IsTH1mg7LXb4qFLhgTnKqS1JhXgAFZ0dV7LfCpmKrLSmR7IKGw2vYBxGLZjpqT0vJR1W
         rI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710654473; x=1711259273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjI0CmTAb9rBKNzvuDpGMzLCdPan9spH7TYPxSq//7M=;
        b=YdAxJocplRCgNX3bNIAiRJAt+wQBotMvz2cHkZcQcafBAvG4Iccs35H25+scUslM3L
         nVyBH5uKzvlJ66FoxxGHDkhTjPJv8NTsDyH1/UOEwhdmLYq4gXGEapqOXEhRj6FeEHd0
         Gfg8S81A5RQTugFTFT3jg3yp50ZRc9la37OUU1PsZLK0pOdx0VoEvheiOpjvcTalgSCe
         ZUl1gmtaAJzniFEzy0sQ5EJztWBmZm7bUq4axBCPgXorsBhY1TsZbRZxtIe7GXD62OGW
         mo3B+G97XXdxqe6yobuacxWNpJme1W4982fbDJ7dgQQ+TEp+dwkRGnKpNCHgLa5551sO
         dQcw==
X-Forwarded-Encrypted: i=1; AJvYcCXdKT7uILmCq4/STi+jrq7IK64t9/bRpFYiFt+qf3POpulPZXRYpZ/2obqFjflJg0aWeqFM1YticP7M+VNhF1kAzKhyNg==
X-Gm-Message-State: AOJu0Yxexr3mRPOgvZtD6BCdkJrUZKLjX1j4R8Xd/TXlA+P8TtPs8ehF
	hKwF1T8wPRx+gpfITFZO2lF6pLV1tmJfZg7o9OfqvWUGLyQ1EFZ4ioSsHOX9sCMvGjpSG0PqpiU
	21AqfmfPFBKaYozBp3GMHGp76uOY=
X-Google-Smtp-Source: AGHT+IF3n6ILrbIcqyw7Dk9ldN+JFXuDe2uBcHpys1fbj9TlKl6rn+Ktc0cERNyAszqG9dMbRhcxpRA2dK4IuomqNow=
X-Received: by 2002:a05:622a:1cf:b0:42e:eb29:91ba with SMTP id
 t15-20020a05622a01cf00b0042eeb2991bamr11260429qtw.63.1710654473492; Sat, 16
 Mar 2024 22:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314141516.31747-1-liuhailong@oppo.com> <20240315081803.2223-1-liuhailong@oppo.com>
 <CAGsJ_4yMXE_4YuMTczF6u4YYp_TWksi+byszD09E2PT5pK8zfA@mail.gmail.com> <ba894762-d3ea-4773-b54c-ce063e1065e5@oppo.com>
In-Reply-To: <ba894762-d3ea-4773-b54c-ce063e1065e5@oppo.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 17 Mar 2024 18:47:42 +1300
Message-ID: <CAGsJ_4wD-NiquhnhK_6TGEF4reTGO9pVNGyYBnYZ1inVFc40WQ@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "mm: skip CMA pages when they are not available"
To: =?UTF-8?B?5YiY5rW36b6ZKExhb0xpdSk=?= <liuhailong@oppo.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nathan@kernel.org" <nathan@kernel.org>, 
	"ndesaulniers@google.com" <ndesaulniers@google.com>, "trix@redhat.com" <trix@redhat.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "surenb@google.com" <surenb@google.com>, 
	"zhaoyang.huang@unisoc.com" <zhaoyang.huang@unisoc.com>, 
	"quic_charante@quicinc.com" <quic_charante@quicinc.com>, "yuzhao@google.com" <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 11:44=E2=80=AFPM =E5=88=98=E6=B5=B7=E9=BE=99(LaoLiu=
) <liuhailong@oppo.com> wrote:
>
> On 2024/3/15 16:46, Barry Song wrote:
> > On Fri, Mar 15, 2024 at 9:18=E2=80=AFPM <liuhailong@oppo.com> wrote:
> >>
> >> From: "Hailong.Liu" <liuhailong@oppo.com>
> >>
> >> This reverts
> >> commit b7108d66318a ("Multi-gen LRU: skip CMA pages when they are not =
eligible")
> >> commit 5da226dbfce3 ("mm: skip CMA pages when they are not available")
> >
> > Reverting these changes seems inappropriate since the original patches
> > did improve most cases.
> > While doing direct reclamation without MOVABLE flags, scanning cma
> > folio doesn't help at all.
> >
>
> Absolutely, but without this patch  it give chance to reclaim cma pages t=
o freelist,
> other tasks without this flag would work normally without holding too muc=
h time
> on lru lock and lru size decrease=E3=80=82 it also trigger memory psi eve=
nt to allow
> admin do something to release memory.
>
> >>
> >> skip_cma may cause system not responding. if cma pages is large in lru=
_list
> >> and system is in lowmemory, many tasks would direct reclaim and waste
> >> cpu time to isolate_lru_pages and return.
> >>
> >> Test this patch on android-5.15 8G device
> >> reproducer:
> >> - cma_declare_contiguous 3G pages
> >> - set /proc/sys/vm/swappiness 0 to enable direct_reclaim reclaim file
> >>   only.
> >> - run a memleak process in userspace
> >
> >
> > I assume that scanning cma folio provides additional opportunities to r=
eclaim
> > anonymous memory, even though it is ineffective for allocating NON-MOVA=
BLE
> > folios. Consequently, we alleviate pressure for future allocations of a=
nonymous
> > folios. Moreover, setting swappiness=3D0 is a rare scenario. Instead of=
 entirely
> > removing the mechanism, could we detect such corner cases and handle th=
em
> > differently.
> >
> > Otherwise, I don't see any chance of this being acknowledged.
>
> It happens in internal aging test. open camera and record 8K video which =
use
> more than 2Gib dmabuf pages. without this patch the devices would kill ca=
mera process,
> but the system hang with it.
>
> In fact, in my opinion the issue of this patch increase the scanning lru =
time
> and reclaim nothing. Do you have a better solution ?

rather than aggressively reverting the original patch which might help lots=
 of
cases, could we just detect the corner cases and fix them , for example, by
something as the belows,

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 96147c4536e4..2f75ad9870c1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -147,6 +147,9 @@ struct scan_control {
        /* Always discard instead of demoting to lower tier memory */
        unsigned int no_demotion:1;

+       /* no skipping cma */
+       unsigned int no_skip_cma:1;
+
        /* Allocation order */
        s8 order;

@@ -1595,7 +1598,7 @@ static __always_inline void
update_lru_sizes(struct lruvec *lruvec,
  */
 static bool skip_cma(struct folio *folio, struct scan_control *sc)
 {
-       return !current_is_kswapd() &&
+       return !current_is_kswapd() && !sc->no_skip_cma &&
                        gfp_migratetype(sc->gfp_mask) !=3D MIGRATE_MOVABLE =
&&
                        folio_migratetype(folio) =3D=3D MIGRATE_CMA;
 }
@@ -1636,7 +1639,7 @@ static unsigned long isolate_lru_folios(unsigned
long nr_to_scan,
        unsigned long nr_taken =3D 0;
        unsigned long nr_zone_taken[MAX_NR_ZONES] =3D { 0 };
        unsigned long nr_skipped[MAX_NR_ZONES] =3D { 0, };
-       unsigned long skipped =3D 0;
+       unsigned long skipped =3D 0, skipped_cma =3D 0;
        unsigned long scan, total_scan, nr_pages;
        LIST_HEAD(folios_skipped);

@@ -1645,6 +1648,7 @@ static unsigned long isolate_lru_folios(unsigned
long nr_to_scan,
        while (scan < nr_to_scan && !list_empty(src)) {
                struct list_head *move_to =3D src;
                struct folio *folio;
+               bool cma =3D false;

                folio =3D lru_to_folio(src);
                prefetchw_prev_lru_folio(folio, src, flags);
@@ -1652,10 +1656,11 @@ static unsigned long
isolate_lru_folios(unsigned long nr_to_scan,
                nr_pages =3D folio_nr_pages(folio);
                total_scan +=3D nr_pages;

-               if (folio_zonenum(folio) > sc->reclaim_idx ||
-                               skip_cma(folio, sc)) {
+               cma =3D skip_cma(folio, sc);
+               if (folio_zonenum(folio) > sc->reclaim_idx || cma) {
                        nr_skipped[folio_zonenum(folio)] +=3D nr_pages;
                        move_to =3D &folios_skipped;
+                       skipped_cma +=3D nr_pages;
                        goto move;
                }

@@ -1716,6 +1721,16 @@ static unsigned long
isolate_lru_folios(unsigned long nr_to_scan,
        *nr_scanned =3D total_scan;
        trace_mm_vmscan_lru_isolate(sc->reclaim_idx, sc->order, nr_to_scan,
                                    total_scan, skipped, nr_taken, lru);
+
+       /*
+        * If the majority of folios are skipped due to contiguous
memory allocator (CMA),
+        * the least recently used (LRU) list might become overloaded
with CMA folios.
+        * This could result in numerous idle loops for non-movable
allocations. On the
+        * other hand, reclaiming CMA folios can alleviate the strain
on other processes
+        * that require anonymous pages.
+        */
+       sc->no_skip_cma =3D skipped_cma > total_scan / 2 ? 1 : 0;
+
        update_lru_sizes(lruvec, lru, nr_zone_taken);
        return nr_taken;
 }


This is merely a proof of concept (PoC), and I haven't even built it
yet. Additionally, LRU_GEN remains
unchanged. It will also need similar changes.

>
> Brs,
> Hailong.

Thanks
Barry
