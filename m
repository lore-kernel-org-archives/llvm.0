Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508320;
	b=ZjmTc+FyhnkVZCr9zGtRVNG41Uwza9ZS5gtnImpvECl6BVRMEBy2K8ExWlIf0YELj2bS
	 OFRVk1JEPPSP/Q5FAhQzxipHXenF4ZnfsE4ca/OK1nTU9HHtUzmpRZXXCr2KOGfIgeGXP
	 WV4YS053JVOOCGcF2k6bVrR3voMVwQxQdx7QPQfzF+oSCW+voce9I65nW9mU7RTX25n5B
	 MBzbRjHW3juYa4CDNnasD3rZxRpURyAPq17ugx88x1cZkKBofBrPGtg2C2CK+3UySLPq7
	 bh+Yi8eYDHGUM927dUXpkiMUIOJf6SJtp0fOs1ssr9oWpDvTkyBxdsGhMgGXUdNwcmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=gocN0lUv+ePHb7pN6LNyapCRmaF7S37bTOPeiY6oAS0=;
	b=mswJDjreb4xU8MCDe5/+2B54y3Z0cCopNaXgLrYlEpCiqBddJJ4moqZZgMQJR56OYvNt
	 xdB8TNLkB5R/s+JD91mFJqLwknyjVehID0nLW4AZecWknfaEXK2wMsyUCl9NZx73MReEy
	 HVsIwRaq2J+MZhQ6U0N7o4UZF5LdweS581VURBI6z1e3aof3GoO8JQXU7I3RD8ozflBmX
	 CmcOh8PdjXuuRt9G+51S8Q4yBEwuO8HsyhyD/diPPHkpCf83VLsGIMcXwPWqxIjFQV1nV
	 WK0PMcqIDT14DDuodBb3o/tgWbFViKD2VVpu5pkwtB/WPrZtt0Cys/qWtC3BdQIrcoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UDMnkWKC;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FFB60A3823
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 14:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FFB60A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UDMnkWKC
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e60f9af6e6so26163405ad.3
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792508319; x=1793113119; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gocN0lUv+ePHb7pN6LNyapCRmaF7S37bTOPeiY6oAS0=;
        b=UDMnkWKCvhg7pLXix7OdT7QANC+O63owl0iL8cj/vS9xtw38UW44W6TbcSUpKdvC0M
         0iW+U3s5UZr7RjDP1T9spwb73IPJ1vZ92rqvbFQ6Av2YZjz/4E1IHSwlxXz6mQGEcOfN
         H6EPnqLV93mHemMYUiGqA5MQd0jIaR2Ieo0jccLFgR7QEnXvP0DuosXbfPLbEqKPpcQr
         rH0/tZ198vQQyZQ4XppV2lMrXWfL9QY7tfuTGB/O+GyMGA6DMy4hFQp6qFdw8pU+oML7
         yoYk+8nmXO4Wpoq89B/SCx7IAyi488tPSnU2kT4bf8fhiq1jRu4y1g5JXDGiy8nQuWCu
         BKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508319; x=1793113119;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gocN0lUv+ePHb7pN6LNyapCRmaF7S37bTOPeiY6oAS0=;
        b=Fd0H4CZNi5P1/8PYqNUplZuzGuMLF4j7zhgIh619tam6hk1ZWu82sSr+DxUFCbczaN
         cRJvORAQ8V+DqGHCwuZ5BUazXGtLIHkcShQjMxCp0hvD5A+Hl3bHwhda4H/nPnoE6CUe
         s3sNahjmQb2XswXyDxH6TrQzgEQVPT0+OrBENRq0EyUxQPTbt5ZKOQhgxJ+6LkWI4pCm
         rMEuE7RRhaMu7xtVfT+yMuQNXfuQtYqr9aHoiwCnRCvTBMM6ZRt59CcCE/YozbbJnqRu
         f7w7FZQ0PKh8pkbrIXqsfVzSRJ7ZTzUnsG9t83rIyWlQ/lFFuyX6zDIXIL59Itm5eQ2V
         znlw==
X-Forwarded-Encrypted: i=1; AKwUvBxZZ3Yc4mOF14UEQyw1Ze5DeYi0rGIlwnbleZUMMDJ8isH3oT5DzaI2sGXzJQVmks0LTpoY@lists.linux.dev
X-Gm-Message-State: AFq9FYJsQ5zcf2ic01ZR8aHXVTTiTEw5Mf/WdZrlse4WUpq3nhTfoMkJ
	NjuA258HjSGkVWmVo0IkJcTG7y+If8BSnMn/kYXZ4Sr6gBOxfFk0Z+24
X-Gm-Gg: AYBFou0GU6E4EnOhTmomB6NZWN0W06P19/O+ILsQMQx/bn4ECQ+iMbfPa/T8Zvhwg9C
	lf13xHb202YjSCg1E3tkgeavY5B1pif06O2dE88lrOOQyXuHmk/AEz27lFVYx8aC+t8Bt22HRye
	rDnuWrjR7Qz8VJ0KlV8XJi5sAJEci1Eza6Tqs3jyNnQHy9IWhevT3I3/zOCxOHuGso4pWrp2QlB
	0Nn7Nivfd9fR0aVmSP4LLubqPJRb4mr9W0Atku8vU2Aj7BLZeAALZRk+XGeJU5OfWNgWvZzJr/p
	Nyazj3fcJ2WErTSoh7d/fQiWVlLo8oHbrBa/nXnXhvB1UHWlmivTJEuUTeUwdDsLaKfgZhy3FVd
	fv0/+PQOCBPiY0uiBk+HTGcQZ3DKsvFhmH1hWJ6uoIx5INpOjICoUxuruQK8rfTpEQr5dIxCXnF
	PnpWD2KIZGA2YKZnj5+faJxvFj1ycDzAgc/Qt07nZDL3oT0lQns491We7FBrgTaovawHZ+xp//z
	2AGIF2AFaI/Gnn2BLdmUtvmKFx774vcVfpCoHbpF1M4KsV8mFeHjSFQ4JcMH7LpR105CnlRYNyA
	Z3y1nQN6muGK8A==
X-Received: by 2002:a17:903:2351:b0:2e9:9f14:c40 with SMTP id d9443c01a7336-2e9a684330amr96805845ad.6.1792508318588;
        Tue, 20 Oct 2026 07:58:38 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b40fe7fsm280255ad.13.2026.10.20.07.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:58:37 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 14:58:36 +0000
Message-Id: <DM9R60QEU8RP.2MWT9CY6J4ZVF@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
 <morbo@google.com>, <justinstitt@google.com>, <menglong8.dong@gmail.com>,
 <bestswngs@gmail.com>, <mattbobrowski@google.com>, <vega@nebusec.ai>,
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf v2 1/1] bpf: reject raw iteration over managed map
 fields
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Zhiling Zou" <zhilinz@nebusec.ai>, <ameryhung@gmail.com>,
 <bpf@vger.kernel.org>, <netdev@vger.kernel.org>, <llvm@lists.linux.dev>
In-Reply-To: <96a6b5dcf721e49c049662cc269d8ac8c389b6af.1792217106.git.zhilinz@nebusec.ai>
References: <cover.1792217106.git.zhilinz@nebusec.ai> <96a6b5dcf721e49c049662cc269d8ac8c389b6af.1792217106.git.zhilinz@nebusec.ai>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 19, 2026 at 11:35 PM Zhiling Zou <zhilinz@nebusec.ai> wrote:
> Revalidate the replacement program against the map associated with an
> iterator link before bpf_link_update() swaps programs. Add selftests for
> allowed prefix access, rejected managed-field reads and writes, and link
> updates that introduce managed-field access.

The sockmap iterator has the same hole.
sock_map_iter_attach_target() checks max_rdonly_access against key_size
at attach time only, so bpf_link_update() can still swap in a prog that
reads past the key.

No need for a new callback that each target has to remember to set.
attach_target can record the limits in bpf_iter_aux_info and bpf_iter
core can check them on attach and on replace. That covers all three
targets. validate_prog, its typedef and the split of both attach
functions go away. Selftests are left out below.

Something like this (compile tested only):

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 0ecb941..ffb6fee 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -544,6 +544,14 @@ static inline void check_and_init_map_value(struct bpf_map *map, void *dst)
 	bpf_obj_init(map->record, dst);
 }

+/* Part of map value before the first special field. Fields are sorted by offset. */
+static inline u32 bpf_map_raw_value_size(const struct bpf_map *map)
+{
+	if (IS_ERR_OR_NULL(map->record))
+		return map->value_size;
+	return map->record->fields[0].offset;
+}
+
 /* memcpy that is used with 8-byte aligned pointers, power-of-8 size and
  * forced to use 'long' read/writes to try to atomically copy long counters.
  * Best-effort only.  No barriers here, since it _will_ race with concurrent
@@ -2992,6 +3000,9 @@ enum bpf_iter_task_type {
 struct bpf_iter_aux_info {
 	/* for map_elem iter */
 	struct bpf_map *map;
+	/* how far a prog may access key and value of the map */
+	u32 max_rdonly_access;
+	u32 max_rdwr_access;

 	/* for cgroup iter */
 	struct {
diff --git a/kernel/bpf/bpf_iter.c b/kernel/bpf/bpf_iter.c
index b40eb40..6f3ae92 100644
--- a/kernel/bpf/bpf_iter.c
+++ b/kernel/bpf/bpf_iter.c
@@ -405,10 +405,21 @@ static void bpf_iter_link_dealloc(struct bpf_link *link)
 	kfree(iter_link);
 }

+static int bpf_iter_check_access(const struct bpf_prog *prog,
+				 const struct bpf_iter_aux_info *aux)
+{
+	if (prog->aux->max_rdonly_access > aux->max_rdonly_access ||
+	    prog->aux->max_rdwr_access > aux->max_rdwr_access)
+		return -EACCES;
+	return 0;
+}
+
 static int bpf_iter_link_replace(struct bpf_link *link,
 				 struct bpf_prog *new_prog,
 				 struct bpf_prog *old_prog)
 {
+	struct bpf_iter_link *iter_link =
+		container_of(link, struct bpf_iter_link, link);
 	int ret = 0;

 	mutex_lock(&link_mutex);
@@ -424,6 +435,10 @@ static int bpf_iter_link_replace(struct bpf_link *link,
 		goto out_unlock;
 	}

+	ret = bpf_iter_check_access(new_prog, &iter_link->aux);
+	if (ret)
+		goto out_unlock;
+
 	old_prog = xchg(&link->prog, new_prog);
 	bpf_prog_put(old_prog);

@@ -570,6 +585,14 @@ int bpf_iter_link_attach(const union bpf_attr *attr, bpfptr_t uattr,
 		}
 	}

+	err = bpf_iter_check_access(prog, &link->aux);
+	if (err) {
+		if (tinfo->reg_info->detach_target)
+			tinfo->reg_info->detach_target(&link->aux);
+		bpf_link_cleanup(&link_primer);
+		return err;
+	}
+
 	return bpf_link_settle(&link_primer);
 }

diff --git a/kernel/bpf/map_iter.c b/kernel/bpf/map_iter.c
index c19b360..9fd5920 100644
--- a/kernel/bpf/map_iter.c
+++ b/kernel/bpf/map_iter.c
@@ -101,7 +101,6 @@ static int bpf_iter_attach_map(struct bpf_prog *prog,
 			       union bpf_iter_link_info *linfo,
 			       struct bpf_iter_aux_info *aux)
 {
-	u32 key_acc_size, value_acc_size, key_size, value_size;
 	struct bpf_map *map;
 	bool is_percpu = false;
 	int err = -EINVAL;
@@ -127,18 +126,12 @@ static int bpf_iter_attach_map(struct bpf_prog *prog,
 		 map->map_type != BPF_MAP_TYPE_RHASH)
 		goto put_map;

-	key_acc_size = prog->aux->max_rdonly_access;
-	value_acc_size = prog->aux->max_rdwr_access;
-	key_size = map->key_size;
+	aux->max_rdonly_access = map->key_size;
+	/* percpu values are copied with special fields zeroed */
 	if (!is_percpu)
-		value_size = map->value_size;
+		aux->max_rdwr_access = bpf_map_raw_value_size(map);
 	else
-		value_size = round_up(map->value_size, 8) * num_possible_cpus();
-
-	if (key_acc_size > key_size || value_acc_size > value_size) {
-		err = -EACCES;
-		goto put_map;
-	}
+		aux->max_rdwr_access = round_up(map->value_size, 8) * num_possible_cpus();

 	aux->map = map;
 	return 0;
diff --git a/net/core/bpf_sk_storage.c b/net/core/bpf_sk_storage.c
index 1d295a8..44b7e61 100644
--- a/net/core/bpf_sk_storage.c
+++ b/net/core/bpf_sk_storage.c
@@ -863,11 +863,7 @@ static int bpf_iter_attach_map(struct bpf_prog *prog,
 	if (map->map_type != BPF_MAP_TYPE_SK_STORAGE)
 		goto put_map;

-	if (prog->aux->max_rdwr_access > map->value_size) {
-		err = -EACCES;
-		goto put_map;
-	}
-
+	aux->max_rdwr_access = bpf_map_raw_value_size(map);
 	aux->map = map;
 	return 0;

diff --git a/net/core/sock_map.c b/net/core/sock_map.c
index 38df842..37144bf 100644
--- a/net/core/sock_map.c
+++ b/net/core/sock_map.c
@@ -1951,11 +1951,7 @@ static int sock_map_iter_attach_target(struct bpf_prog *prog,
 	    map->map_type != BPF_MAP_TYPE_SOCKHASH)
 		goto put_map;

-	if (prog->aux->max_rdonly_access > map->key_size) {
-		err = -EACCES;
-		goto put_map;
-	}
-
+	aux->max_rdonly_access = map->key_size;
 	aux->map = map;
 	return 0;


> Fixes: 9db44fdd8105 ("bpf: Support kptrs in local storage maps")

Wrong tag. Iterators could write special fields from the start:
commit d6c4503cc296 ("bpf: Implement bpf iterator for hash maps") and
commit 5ce6e77c7edf ("bpf: Implement bpf iterator for sock local storage map").

[...]

> +	/* Fields are sorted by offset; max_rdwr_access is an exclusive end. */
> +	if (map->record && value_acc_size > map->record->fields[0].offset)

This will crash. map->record is an ERR_PTR when btf_parse_fields()
failed, and map_check_btf() still creates the map. A value with two
struct bpf_timer gets -E2BIG, for example. That's why other users check
IS_ERR_OR_NULL(). Attaching any iterator to such a map now faults on
fields[0], whether the prog touches the value or not. Same in
bpf_iter_sk_storage_map_check_prog().

Percpu maps don't have this bug. Their iterator runs on
percpu_value_buf: copy_map_value_long() skips special fields and
check_and_init_map_value() zeroes them, so the prog sees zeros and
writes to a temporary copy. This check rejects a prog that sums a
counter over all cpus in a percpu hash that has a kptr, for no reason.

It's an old bug, it needs root and the fix rejects progs that load
today. Pls target bpf-next.

pw-bot: cr
