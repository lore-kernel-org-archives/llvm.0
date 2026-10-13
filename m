Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3569550DD8
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932956; cv=pass; b=aJKGWBNta899i5V4Q8lDTu+eaadBUpCE0pCTrfdEQ2GOv4oTdMnW1/BwIT/gJ2HNCte7IXyt46TO4cwCnzSqzLpuYRfOWrmWYArQCVUxwBT1gqNjXUGZOZg1M/u1R+bTVgZxODYZ1twA39VixSVyaX5b9QZ/cuGWx27USymZWEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932956; c=relaxed/simple;
	bh=JvtBTH42uQf0GJZrDLEFCb32oOnKW32kHQ1fPumsBNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nH3m+PhW8b8H8+emX9TOwlu0DEQduD97DUDvtVsgPc+Dt0RnuQ+Q4+VVBpewOoyrsmp+AfcrdsWbTR8y9DK7XLcHAx0nq/dlDaNUyaIx5yzwtOg4IFvsW7lJfkNKFCI8z3gXad3KB1MeAl1nUgiEZxJ1yy50uyW76LCtLMR7Df4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4+KmD0g; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4+KmD0g"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5337fa12431so1009741cf.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 16:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932954; cv=none;
        d=google.com; s=arc-20260327;
        b=WZ2zecUnC5amVVC7kEVXRmdf5J7hfzt/xRIQRaQj1ZaQ8qjdfwZ/3qPxajQUZeJXwf
         +uyvKb4rUqA8f5nXKuUU8PG6jbwVd8Sh8Y4JqFkwy549EnSf0R3QFRSlqL2QSjQsZIsb
         iAYsfeXM5Ak/encPUxbpAeASaC+SjyheB1cwNVtwdF+Iko2CSnGP89wke0PX0cf9blWl
         ZVjIaJzKr1utVtWHqxj2QNLTeTE4teEzRnTsFB3/ZSm1SugWOhIFF30KDEL7BmBVjlwM
         OttglurB7gnrFSm+/r9XSETt7CldTqW4cN1/nMSp/Yy0Jf044FBzoOKf/tksxn9SAC02
         ARgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JKJEP+nzVcv1V56tS7nuXBPb/u2Yy0nrN8gT7QG5wn4=;
        fh=cfU4AITmnBonjC2QR/ZeD5EpFEK1xbsBiMIslf5787s=;
        b=HoKq5IPkmu1gjtp+eoxYXcxxUjsfPQPiFLPJ6giqOrXO4TwqiGsEHD8CYtVIlTeG5V
         pMfOWvhVDfN1pb8XbmtTntyUDlexrS5OE+X8QCAV91VGzXj9Z3v6hGKkxSCB9D67fjMj
         XKRl/Ep5/sqXWkh8bwwOhunHpjZ4BwCwTClUbaQ0VXoST43B74mxlwRbfW6ri1M7kAeQ
         M21kOf7gygmU52mR6txlkankRXxwN74TjoX0+jMXTENubwgRCLe9qvhH+qCO1JL+WNum
         afSyJfVaxNi16YIhUeMMLoGTupRJTfe7AciprOuFcBY/7JGBFgfvvtOW8RHEchpHtn4p
         6QUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791932954; x=1792537754; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKJEP+nzVcv1V56tS7nuXBPb/u2Yy0nrN8gT7QG5wn4=;
        b=o4+KmD0gyKcAsa86WE8H/IcdjgaGY2kvwMQ6pr7cfQlijYM+PDJkba1cdkqQXL47oc
         oVUAz3wUvMkIknjteAdoPuz3HWZtm2vkPr1jhGRRVbswJYohhXh88nqZIWytsC4JAwu+
         awdoW5oqC6uZ5QQgNoJyvQ5NOmhk6Dfar/4EF6KcQ9mh5ZcCJtcKPmkx82rcwHuRP0SC
         UW9k/IsH5YGhA2iqBjuWTYpdzzbMcK2WMlSGuDuFrOvrfMmbQwTV3dvCM7m41cjHAW4V
         b5ffDKeaYifNFSGPrqcZEFI+HE4gI94QAFDLwOh7yAPsGvMl9pCDKVRAbY2CueBCJq05
         zy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932954; x=1792537754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKJEP+nzVcv1V56tS7nuXBPb/u2Yy0nrN8gT7QG5wn4=;
        b=UoXdU5+3rJf+ZEV6XIz9D+crLWwYfKdyV0PIEY6Y8wqI2iOphAQGdrO4kiJMPu0i/9
         1hUiSSvWBo5k18wKem4p/kYHKULvODja7Z4epvZwoaHnbsgNEPfO1IwpnyAC5FFn0/mu
         5Vu50G8G1qThJ5ySQbsCbdV6+qLnP62eZJrW40480NGo0uZ+ygYpNZMRUX0MckWPagPu
         K6IOsbu79sem0x1em9DUHXVs+4MJFtZAmg38obNiAvbLZi3dy+gUatAp5RBpOc9/xcM0
         KSzTwEwRXJeK1OubC2Pt+ZWJds7epmD88zMe8RJWwYAP+EDVxtvWz9+n6zswh+V+WNZb
         KR9A==
X-Forwarded-Encrypted: i=1; AKwUvBznQ0kSPa/GiNx4o7XFrCcagvY50MB//JcviEATrmEDvJS0FsXS1PnlrO2ZEgSjB22MlWDe@lists.linux.dev
X-Gm-Message-State: AFq9FYLoPLb4JqHof1TKmUtykjb5VGmY+W/nfjdrYsQOtR8ibWMJLQBu
	OBCLjiiggbRfQh7kisxPIbm0E9vsk+f1llMIudQGg3sQ3u+YOsUF4QEwjo2TWxadfdojgGCqAd6
	Ztjw4p7+7IJdVTO1TWVoXeUUXxhxxZMfhFO2zlTCW
X-Gm-Gg: AYBFou13nXgqhApG2sn/2vhI8CF/kLGYezsH2vR6bhQ9LGbCJrRumDaiaDrH7sWhVsc
	9idylQkNRG2Pm7Ow3xoQAeBSgQL+EjmrM0VI8MF7o451Fkg2FFNXXPYlIFgQ10e+JDm6y29YJTb
	ZHtB4MMNtRm/6eiWO9pIyCziMFiN2rSdcrBtP+67lT8i/gXkHGswzcfnbrVi4UyPRr52gQrVn7z
	XC/wzdKHIQZ/utNLDRC9BuwI15140TyvUpUCDhwXHgRhK49e/UI+IRbAzTRFtMm6Z90lSdh38q2
	5P1C4WfOnsftt/ND75D8/dDVxJz1Re9t3mmmJa/N6qalED3NThmPIMPo73qYefgfqyN36a08PsQ
	BPdzTGFQB
X-Received: by 2002:a05:622a:2b48:b0:532:d36c:7094 with SMTP id
 d75a77b69052e-53602cf1301mr1528801cf.4.1791932952857; Tue, 13 Oct 2026
 16:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
 <3f57ddf4-b1a7-4c91-8983-c8cd83d0f25c@acm.org>
In-Reply-To: <3f57ddf4-b1a7-4c91-8983-c8cd83d0f25c@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 16:09:00 -0700
X-Gm-Features: AclHuK8sVKLuenhmPgQR2YkD4GWpk6lsXR7zsTAaKiowHqlv9ljvmiPS-1EbOyM
Message-ID: <CAP-5=fX3e4HRaLXxQhCwEHRuXZdpC0zEEh2pozEEegQBxgc5xw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
To: Bart Van Assche <bvanassche@acm.org>
Cc: acme@kernel.org, elver@google.com, namhyung@kernel.org, 
	adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:53=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/13/26 3:26 PM, Ian Rogers wrote:
> > The perf tool previously added Clang thread-safety annotations in
> > tools/perf/util/mutex.h (GUARDED_BY, LOCKABLE, EXCLUSIVE_LOCK_FUNCTION,
> > UNLOCK_FUNCTION, etc.). Since then, the Linux kernel has adopted a
> > unified set of static context analysis macros and attributes in
> > include/linux/compiler-context-analysis.h (context_lock_struct,
> > __guarded_by, __acquires, __releases, __must_hold, etc.).
>
> New versions of a patch series should be posted as a new e-mail thread
> instead of as a reply to an existing email thread. Additionally, posting
> a new version of a patch series only four hours after the previous
> version is way too soon.
>
> The LLM that I asked to take a look at this patch series came up with
> the feedback below. Please take a look at this feedback.

Hi Bart,

Which mailing list is objecting to the frequent emails? I'll remove it
and yourself from follow ups as the intended recipients are on
linux-perf-users except for patch 1, which fixes a build issue in a
file copied into the tools directory. The LLM feedback included was
flawed and introduces feature creep.

Thanks,
Ian

> Thanks,
>
> Bart.
>
> -------------------------------------------------------------------------=
-
>
> Verdict: Needs Substantive Revision
>
> While the overall goal and majority of the annotations are
> well-executed, several patches bundle distinct bug fixes with
> refactoring and annotation churn (violating the "one logical change per
> patch" rule).
> Additionally, there are concurrency and lifetime subtleties in the newly
> introduced dsos__findnew_id() read-lock fast path and vdso.c, an
> unsynchronized benign data race in maps.c, and missing Fixes:
> attribution tags.
>
> 2. Critical & Concurrency Findings
>
> A. Patch 07/10: Lock drop-and-reacquire race and unneeded
> re-invalidations in dsos__findnew_id()
>
> In tools/perf/util/dsos.c:
>
> struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const
> struct dso_id *id)
> {
>         struct dso *dso;
>         down_read(&dsos->lock);
>         dso =3D __dsos__find_id(dsos, name, id, false, /*write_locked=3D*=
/false);
>         if (dso && !dso__needs_improve_id(dso, id)) {
>                 up_read(&dsos->lock);
>                 return dso;
>         }
>         up_read(&dsos->lock);
>         down_write(&dsos->lock);
>         if (dso)
>                 __dso__improve_id(dso, id);
>         else
>                 dso =3D __dsos__findnew_id(dsos, name, id);
>         up_write(&dsos->lock);
>         return dso;
> }
> Issue: If dso is found under down_read but needs ID improvement
> (dso__needs_improve_id(dso, id) =3D=3D true), up_read() releases the lock=
.
> Before down_write() is acquired, another thread may have acquired
> down_write() and already improved the DSO's ID with the identical or
> better info.
> Consequence: When down_write() is acquired, __dso__improve_id(dso, id)
> is executed unconditionally without re-checking dso__needs_improve_id().
> While updating fields is mostly idempotent, __dso__improve_id() sets
> dsos->sorted =3D false;, unnecessarily degrading subsequent read lookups
> to qsort().
> Fix: Re-check dso__needs_improve_id(dso, id) under down_write(). If no
> improvement is needed, avoid calling __dso__improve_id().
> B. Patch 07/10: Unnecessary lock churn and array sort invalidation in vds=
o.c
>
> In tools/perf/util/vdso.c:
>
> static struct dso *__machine__addnew_vdso(struct machine *machine, const
> char *short_name, const char *long_name)
> {
>         struct dso *dso;
>         dso =3D dso__new(short_name);
>         if (dso !=3D NULL) {
>                 dsos__add(&machine->dsos, dso);
>                 dso__set_long_name(dso, long_name, false);
>         }
> Issue: Calling dsos__add() followed by dso__set_long_name() causes two
> separate down_write(&machine->dsos.lock) acquisitions in immediate
> succession. Worse, dsos__add() inserts the DSO into the array ordered by
> its current short_name. Immediately afterwards, dso__set_long_name()
> mutates the name and explicitly sets dsos->sorted =3D false; (lines 1528
> in dso.c).
> Fix: Set the long name before adding the DSO to dsos (matching the
> pattern used in dsos__findnew_module_dso() in util/dsos.c):
>
>         dso =3D dso__new(short_name);
>         if (dso !=3D NULL) {
>                 dso__set_long_name(dso, long_name, false);
>                 dsos__add(&machine->dsos, dso);
>         }
>
> This requires only a single write lock acquisition in dsos__add() and
> keeps dsos->sorted =3D true.
>
> C. Patch 10/10: Unsynchronized concurrent write in maps__find_by_name()
>
> In tools/perf/util/maps.c:
>
> struct map *maps__find_by_name(struct maps *maps, const char *name)
> {
> ...
>         while (!done) {
>                 down_read(maps__lock(maps));
> ...
>                 /* Second search sorted array. */
>                 if (!done && maps__maps_by_name_sorted(maps)) {
>                         struct map **mapp =3D
>                                 bsearch(name, maps__maps_by_name(maps), _=
_maps__nr_maps(maps),
>                                         sizeof(*mapp), map__strcmp_name);
>                         if (mapp) {
>                                 result =3D map__get(*mapp);
>                                 i =3D mapp - maps__maps_by_name(maps);
>                                 RC_CHK_ACCESS(maps)->last_search_by_name_=
idx =3D i;
>                         }
>                         done =3D true;
>                 }
>                 up_read(maps__lock(maps));
> Issue: last_search_by_name_idx is written while holding only
> down_read(maps__lock(maps)). Because multiple reader threads execute
> maps__find_by_name() concurrently, this is a concurrent write race
> (which is why last_search_by_name_idx could not be annotated with
> __guarded_by(&lock)).
> Consequence: Under TSAN or strict memory models, unsynchronized
> conflicting writes cause data races.
> Suggestion: Use WRITE_ONCE()/data_race() on the assignment, or annotate
> last_search_by_name_idx with a brief comment explaining that this is an
> intentional, benign unlocked cache update.
>
> 3. Patch Architecture & Organization Findings
>
> Per Documentation/process/submitting-patches.rst ("Separate each logical
> change into a separate patch"):
>
> Patch 07/10 mixes 4 distinct logical changes:
>
> Bug fix: Fixing the unlocked __dsos__add() call in __machine__addnew_vdso=
().
> Performance optimization: Adding the read-lock fast path in
> dsos__findnew_id().
> Refactoring: Replacing _dso__data_open_lock and pthread_once with
> DEFINE_MUTEX(dso__data_open_lock).
> Annotations: Adding static context analysis macros across dso.c, dso.h,
> dsos.c, dsos.h.
> Recommendation: Split this patch into at least 3 patches:
> Standalone bug fix for vdso.c with a Fixes: tag (see metadata below).
> Standalone performance optimization for dsos__findnew_id().
> DSO/DSOs lock annotations and mutex cleanup.
>
> Patch 09/10 bundles three disparate subsystems plus a bug fix:
>
> Combines perf config, intel-tpebs, and perf_env.
> Includes a real bug fix: fixing an unlocked read of tpebs_reader_thread
> after releasing tpebs_mtx in tpebs_stop().
> Recommendation: Split the intel-tpebs race fix into its own commit with
> a Fixes: tag. Split the remaining annotations into separate commits per
> subsystem (perf config, perf intel-tpebs, and perf env).
>
>
>
