Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194817;
	b=jYxXm0w9qw305dYAs8Gu8b7lfUWSCXJnFTC5LYCof/gB2+ot4TtuNlGKBaEK1lIaz1gH
	 gtX6Lsy+qN/25675zn9ijt5PBLX3I9MnET6STHX7M1XhotCK68frfTzTRS4yAjelNrffz
	 oX1jycpRq8insrFwHK/fduz7XR5xx9m4dLvzVBNiox9b6A1nd/Ed6AsO0DAl8IJUYHvB7
	 bFIbkIoQvEX6WjBtwF1j4rqjXJ/E/hUfcl2/75radCkuqQhI63VRfB0Uj8jpEQjUwueoY
	 1ZU9bK+GOY2UujFypbmmLQQeC0F+Lkn7O6d/m1mcjC6KOB/Qemlh5QG+su5IvLSY1jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rTR6fgNF+2TTk5l8yXrK2u6P71Yis/UBObU7lA/CVSY=;
	b=4Xw5aQ4MOe8JYwU9gr9+r8DDAqfoZ8MitakaY7hDvP095VX2pntnME06eVNft5f2nSeP
	 q72zI5CcmJSkLZKtBkiXinubxn0rm5NvDJWVxriyjHJJTKRuNRBDHUbroBcvTWmWo2Ea3
	 dhGNPDsp5CR0loQckc96fXXecBE0X+koLtTmBRvwBrRnHWv6Z9Uuz26t3m84WPXrQ6IGh
	 hBIU29FzWxaPfhPRTfHRMWWOZl8xLlwh5mAt1EL7jn4J+znOSgPo8ui3YZfnU5328BN4h
	 wiFIOZG390+ygQz8Sxe9Kw7gCOE+2zwhDhxVM1tUCed9iTUjgkFHvqFey+BRYuHoiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjcL7F2A;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FC4606A320
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 13:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjcL7F2A
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so9420305e9.2
        for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793194815; x=1793799615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTR6fgNF+2TTk5l8yXrK2u6P71Yis/UBObU7lA/CVSY=;
        b=TjcL7F2AWPINothYE5cBw5uXp/a9WiFi31csMdLS+T1+J5lag3x9iySMh+Ce7k84a7
         6bfLaeA6POHzgtTG1I0N8qStWcGMZpDEFpWZ897xUY3+vEtlh+wvqEoaUXAD6OM6f6CJ
         qwmogyKIZmrZ6r+USdw6DOM5NxGxo6spZK21D73IYbvLQGvo3JNe5m2LMB9cD4X4X026
         FdVxrlW27BG1Ge67qXBjy8zCxPDKOSvc5U+xxpCEvbiAcmW9/Rm59gtYxeNk5CFW6WjZ
         +F7S1ttQSa3lZtxLdmOdk8n25MJ5jvKMS8UJXPfgUyVapqh5AoXeKKxsOtzrSdhBwnpo
         Q4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194815; x=1793799615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTR6fgNF+2TTk5l8yXrK2u6P71Yis/UBObU7lA/CVSY=;
        b=fF8er97DRpAqVhp4K4zxZWfteByFBAAlDkAMkI6+ax67rWiofBKGptP+/dOVm9kM7W
         oilDvB4HisYj2D1eL31eWrO6NHpRGiAHpmmWyLBMQRZ1Nf9V41dGOMQzziYJkI4RTdN5
         89eftVfC/4Yevxz4tGi3rA9SvqM3ylr9l8qNRwBDJzkX2IaO0Y3mYRcsr3apZ9Q5WjPZ
         0QGtVjkrNPw3667y83BB5CaLjZLsRALBPNQeFL6HmJnkRTHz0pjvrGnaPIJUbc7ZLulY
         osXmgwmKjYuLO5yUjNr5UfUQBPI8JLQ1IY6EgHbY9UT+4UxYvwkjDrtIIOzNTrLoGiqn
         EJeA==
X-Forwarded-Encrypted: i=1; AKwUvBy02bHwQTjA0YtRk4hz8+WLCxO7RSIpzxDQ7BYDfL1jTlKer+Z/7Qg05NJYx3ROeaELAjOw@lists.linux.dev
X-Gm-Message-State: AFq9FYLoGbcqO/6UYB0rWSArYoEUFkmD0R6eNFezzMq96EsreOMkKQ7t
	M22yUvfqKWSmD9FTeR0R+pUk4XEHf3F1mTcFn8GD8OlTBSIJo/G5pdPV
X-Gm-Gg: AYBFou360Gmmwe+TrdTWVMK26o7Yas7/8lP145M/phUe59AOjg7EkzOD+2KTkf6qTf0
	fc7Amq7TweMYbyXorW3YlDmKo9v/Ea+dOilXKD6qmCxPVc9rMjRNlmo5IRq3rn4p4kswYUXU0e5
	e1TYsjdlr6GuMIG5vZSIU9tI7b/W864A73hqCz8TxPrC258I4i0gRbrYzYqpq5QC93HW9+sf+Qx
	D9oUSdOwhZPtxIdAcDAS7CmHXkwI8ch/H3H0mxAohvLCgaA5mPiKVhtwYAaddLl51AsHMkiMXO7
	cOGVPVCo9y2LDgOdVQvVIz+bg8xj7+wHR9dpZrjpUCFF3N4rvIutJGETbQnKL8tqFSj17/PDk04
	5N1e9fZeF2fSezWbgaFFDpyrKM74bZuwja4D7ZQMv/VIMBJKMu3J5Bg+ag6WXfwIRSa++fnoX6/
	DBYV08IDZ56H3hJgZdHMnAa7vbCkC9bI95WT3HVw6VNEx0OQR2i6SsXjJXcJTvrNBGE2pxkTH7S
	0uCVJiW/wP2kwmYJZ6KHj+5/Sn9tSQjzFRWhKH8An6AEhWgjdrlm8moStGTXBL0ad9PuFxoTzgw
	02ghAiFeM48SuGchHNvbsHP+7uxrNvDiX5OFfLcmuyu3ZS0DDxEGmmQW7+i/iU8ViA8=
X-Received: by 2002:a05:600c:6085:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a996a9e304mr40226765e9.5.1793194814621;
        Wed, 28 Oct 2026 06:40:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm29592978f8f.47.2026.10.28.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:40:14 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:40:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261028134012.01d52e94@pumpkin>
In-Reply-To: <20261023001603.560210-9-wusamuel@google.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 17:16:02 -0700
Samuel Wu <wusamuel@google.com> wrote:

> Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsyms
> to support fast point queries without scanning the entire text file.
> Exactly one query mode must be set in query_flags.
> 
> When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
> resolves a NUL-terminated symbol name in vmlinux or loaded modules and
> then populates sym_addr:
> - Searches vmlinux first via kallsyms_lookup_names() (binary search),
>   which takes precedence over loaded modules, and falls back to
>   module_kallsyms_on_each_symbol() under module_mutex for module
>   symbols
> - Matches names exactly, like kallsyms_lookup_name(), disregarding the
>   .llvm.<hash> matching, following precedent set by commit fb6a421fb615
>   ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")

Hmmmm....
What happens when you have functions foo and foo.constprop0
In some sense they are duplicates.

> - Resolves 0x0 symbol addresses in both vmlinux and modules
> - Rejects ambiguous symbols (multiple entries with the same name at
>   different addresses within vmlinux, or across loaded modules) with
>   -EADDRNOTAVAIL, while allowing same-address aliases
> 
> Userspace symbolizers resolve kernel addresses to symbol names with
> /proc/kallsyms. This is typically done by reading the entire
> /proc/kallsyms text file, and keeping a compressed sorted copy of it in
> order to resolve addresses at runtime.

You could mmap the tables into userspace and have a ioctl that reported
the offsets of the tables (etc).
Then user lookup would faster then kernel lookup!
Especially since you could throw a bit more memory at it to remove the
linear scans.

> 
> When KALLSYMS_QUERY_BY_ADDR is set in query_flags, KALLSYMS_QUERY
> resolves one address to the symbol that contains it:
> - sym_addr holds the address to resolve on input.
> - sym_name_addr must point to a user buffer of sym_name_size bytes
>   that receives the NUL-terminated symbol name. On output,
>   sym_name_size holds the number of bytes written (including the
>   terminating NUL). -ENAMETOOLONG is returned if the buffer is too
>   small; a buffer of KSYM_NAME_LEN (512 at the time of writing) bytes
>   is always large enough.
> - Symbols are resolved via kallsyms_lookup(), the same lookup as %pS,
>   covering vmlinux, loaded modules, BPF JIT images, and freed module
>   init functions still tracked by ftrace.
> 
> On an 8 CPU Cuttlefish (x86-64 VM), using this patchseries to load a BPF
> program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms).

Have you tried measuring it with my patches that speed up the kernel
'search by name' code?
That speeds the lookup by a factor of ~18 (testing the code in userspace).

You also should allow for 'find first' and 'find next'.
As well as letting the code iterate though functions with the same name
it is absolutely trivial to enhance the 'lookup by name' code to match
a prefix.
(Basically it needs to 'return -index' instead of 'return -1' when the
binary scan fails.)


> 
> On an 8 CPU x86-64 VM with a 175k line kallsyms, there are broad
> performance and memory savings for the symbolization and callstack
> sampling tool, Perfetto:
> - Init time: ~350x speedup (155.7ms -> 0.44ms)
> - 50k symbolizations: ~12x speedup (25.2ms -> 2.2ms)
> - VmRSS: -68% (15.1MB -> 4.8MB)
> 
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  include/uapi/linux/fs.h |  41 +++++++++++++
>  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 173 insertions(+)
> 
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 34c6f219462a..b43f227dad0e 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -674,6 +674,47 @@ struct procmap_query {
>  	__u64 build_id_addr;		/* in */
>  };
>  
> +/* /proc/kallsyms ioctl */
> +#define KALLSYMS_QUERY	_IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsyms_query)
> +
> +/* Exactly one query mode must be set in query_flags. */
> +enum kallsyms_query_flags {
> +	/*
> +	 * Look up a symbol in vmlinux or loaded modules (vmlinux first; BPF
> +	 * and ftrace symbols are not searched) by exact NUL-terminated name
> +	 * at sym_name_addr and return sym_addr. sym_addr and sym_name_size
> +	 * must be 0 on input.
> +	 */
> +	KALLSYMS_QUERY_BY_SYMBOL = 0x01,
> +	/*
> +	 * Look up the symbol covering sym_addr and write its NUL-terminated
> +	 * name to the sym_name_addr buffer of sym_name_size bytes. The same
> +	 * symbols as %pS are searched: vmlinux, loaded modules, BPF JIT
> +	 * images, and freed module init functions still tracked by ftrace.
> +	 * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes is
> +	 * always enough. On success, sym_name_size is set to the number of
> +	 * bytes written (including the terminating NUL).
> +	 */
> +	KALLSYMS_QUERY_BY_ADDR = 0x02,
> +};
> +
> +/*
> + * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name maps to
> + * more than one address, -ENAMETOOLONG if the name does not fit in
> + * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes, and
> + * -EPERM if kallsyms addresses are hidden from the opener of /proc/kallsyms
> + * (e.g. kptr_restrict).
> + */
> +struct kallsyms_query {
> +	__u64 size;		/* in - struct size for compatibility */

I'm not sure you need a size here as well as the one in the ioctl command.
It only complicates things when they differ.

If you need a new version they you add an extra case to the switch statement.
Simple and easy,

> +	__u64 query_flags;	/* in - query mode (enum kallsyms_query_flags) */
> +	__u64 sym_name_addr;	/* in - address of symbol name buffer */
> +	__u64 sym_addr;		/* out (BY_SYMBOL) / in (BY_ADDR) */
> +	__u64 sym_name_size;	/* in/out - name buffer size / bytes written */

Maybe separate the buffer size from the length of the symbol written?
The in/out parameter will get annoying in code doing multiple lookups.
Or just have the buffer size and require it to be '\0' terminated.
(There is a strncpy_from_user() can that be used.)

The '\0' terminated string handling is likely to be noise against
all the rest of the lookup code.

David

> +};
> +
> +#define KALLSYMS_QUERY_SIZE_VER0	40 /* sizeof first published struct */
> +
>  /*
>   * Shutdown the filesystem.
>   */
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index aec2f06858af..7caaf3e421c7 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -31,6 +31,7 @@
>  #include <linux/kernel.h>
>  #include <linux/bsearch.h>
>  #include <linux/btf_ids.h>
> +#include <linux/uaccess.h>
>  
>  #include "kallsyms_internal.h"
>  
> @@ -922,11 +923,142 @@ const char *kdb_walk_kallsyms(loff_t *pos)
>  }
>  #endif	/* CONFIG_KGDB_KDB */
>  
> +struct kallsyms_mod_find_ctx {
> +	const char *name;
> +	unsigned long addr;
> +	bool found;
> +};
> +
> +static int kallsyms_mod_find_cb(void *data, const char *name, unsigned long addr)
> +{
> +	struct kallsyms_mod_find_ctx *ctx = data;
> +
> +	if (strcmp(name, ctx->name) != 0)
> +		return 0;
> +	if (ctx->found && ctx->addr != addr)
> +		return -EADDRNOTAVAIL;
> +	ctx->found = true;
> +	ctx->addr = addr;
> +	return 0;
> +}
> +
> +static int do_kallsyms_query(struct kallsym_iter *iter, void __user *uarg)
> +{
> +	char namebuf[KSYM_NAME_LEN];
> +	struct kallsyms_query karg;
> +	unsigned long addr;
> +	unsigned int start;
> +	unsigned int end;
> +	unsigned int i;
> +	__u64 usize;
> +	long len;
> +	int err;
> +
> +	BUILD_BUG_ON(sizeof(struct kallsyms_query) != KALLSYMS_QUERY_SIZE_VER0);
> +
> +	/*
> +	 * The text interface shows zero addresses to openers without permission.
> +	 * A zeroed point query result is useless (and an address-to-symbol query
> +	 * would leak KASLR), so fail instead.
> +	 */
> +	if (!iter->show_value)
> +		return -EPERM;
> +	if (copy_from_user(&usize, uarg, sizeof(usize)))
> +		return -EFAULT;
> +	if (usize > PAGE_SIZE)
> +		return -E2BIG;
> +	if (usize < KALLSYMS_QUERY_SIZE_VER0)
> +		return -EINVAL;
> +
> +	err = copy_struct_from_user(&karg, sizeof(karg), uarg, usize);
> +	if (err)
> +		return err;
> +
> +	switch (karg.query_flags) {
> +	case KALLSYMS_QUERY_BY_SYMBOL:
> +		if (karg.sym_addr || karg.sym_name_size)
> +			return -EINVAL;
> +
> +		len = strncpy_from_user(namebuf, u64_to_user_ptr(karg.sym_name_addr),
> +					sizeof(namebuf));
> +		if (len < 0)
> +			return len;
> +		if (len == 0)
> +			return -EINVAL;
> +		if (len == sizeof(namebuf))
> +			return -ENAMETOOLONG;
> +
> +		if (kallsyms_lookup_names(namebuf, &start, &end)) {
> +			struct kallsyms_mod_find_ctx ctx = { .name = namebuf };
> +
> +			err = module_kallsyms_on_each_symbol(NULL, kallsyms_mod_find_cb, &ctx);
> +			/* Check first: maps -EOPNOTSUPP (CONFIG_MODULES=n) to -ENOENT. */
> +			if (!ctx.found)
> +				return -ENOENT;
> +			if (err)
> +				return err;
> +			addr = ctx.addr;
> +		} else {
> +			addr = kallsyms_sym_address(get_symbol_seq(start));
> +			for (i = start + 1; i <= end; i++) {
> +				if (kallsyms_sym_address(get_symbol_seq(i)) != addr)
> +					return -EADDRNOTAVAIL;
> +			}
> +		}
> +
> +		karg.sym_addr = addr;
> +		break;
> +	case KALLSYMS_QUERY_BY_ADDR:
> +		if (!karg.sym_name_size)
> +			return -EINVAL;
> +		addr = karg.sym_addr;
> +		/* Reject addresses that do not fit in unsigned long (32-bit). */
> +		if (addr != karg.sym_addr)
> +			return -ENOENT;
> +		if (!kallsyms_lookup(addr, NULL, NULL, NULL, namebuf))
> +			return -ENOENT;
> +
> +		len = strlen(namebuf) + 1;
> +		if (karg.sym_name_size < len)
> +			return -ENAMETOOLONG;
> +		if (copy_to_user(u64_to_user_ptr(karg.sym_name_addr), namebuf, len))
> +			return -EFAULT;
> +
> +		karg.sym_name_size = len;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user(uarg, &karg, min_t(size_t, sizeof(karg), usize)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct seq_file *m = file->private_data;
> +
> +	switch (_IOC_NR(cmd)) {
> +	case _IOC_NR(KALLSYMS_QUERY):
> +		if (!extensible_ioctl_valid(cmd, KALLSYMS_QUERY, KALLSYMS_QUERY_SIZE_VER0))
> +			return -ENOIOCTLCMD;
> +		return do_kallsyms_query(m->private, (void __user *)arg);
> +	default:
> +		return -ENOIOCTLCMD;
> +	}
> +}
> +
>  static const struct proc_ops kallsyms_proc_ops = {
>  	.proc_open	= kallsyms_open,
>  	.proc_read	= seq_read,
>  	.proc_lseek	= seq_lseek,
>  	.proc_release	= seq_release_private,
> +	.proc_ioctl	= kallsyms_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.proc_compat_ioctl = compat_ptr_ioctl,
> +#endif
>  };
>  
>  static int __init kallsyms_init(void)

