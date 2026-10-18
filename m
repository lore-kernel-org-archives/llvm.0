Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8C49AA4B
	for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357261; cv=pass; b=JuZsLLuyhrzsRtqI0ScMo+BvOGwJSpHU72q4rwQgWc3RcaJK4sNN85TSzT5qlHKWoZxS9eHy72ikaGZYRj8R1JTbzyGQWbmBcxndJH7316Aol4B1Ju7qK13zZhwdfUawwN1b0H2/8ja6y7Qrn+5VqmkAwUnpHtErByi1Ky2iozY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357261; c=relaxed/simple;
	bh=yU9cl3c1Rr4o+KFe3CKBgO6vxhJtdabhUkG0Xvxyy1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OG/QFKZ6J5NcxgU8ZZZTKeC79zZq0dCHCEsOvnEOihlCdeyeX+fCFS7/pbGVrGtyB2qodwtst2JdPLjU7D9J4uaKs7tZeQXRacGfMmFrkzCZHhhMe/MDS2mqIhex6y8AkkRYkk/w5+vSRMaTKJSyfowjUQWVlkqU5at67c8qfFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYPUnOTS; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYPUnOTS"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3962628eec.0
        for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 14:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792357259; cv=none;
        d=google.com; s=arc-20260327;
        b=g4FWnTA3aafFIhJN6pUiGU6Fq5VkHuLo+oKdowgVJxkVZlPi/6s7aQIEka14SLHgoX
         ptLhzblsELhVLWHpQYOWhKYsWHaGDOaJ9k5ZOoTkMIkPrdk03p52fXw4ZzbkjoN6pCvl
         fxPZ4v/ahdsmsOin26w2qb2HhXY++31ouquQ8qWZG3PiHpEWR5dYVEsAErKCbtowdlVT
         0/qAAGSkARFHoaYW8ywQDBSXMvYfTvsDpRyodm8/32rmrOUPt8Vo7DhMsER4wLWcv7Fi
         e00vLsYyGsA9k2UbgJJt7r7cHDmwRTyNe/8DQnA1MKHBFF3vR/IQPOeRF1sY3tvOoSsJ
         Aa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=opFHVg6d3nnPqZDxx8fTz6mfxSvEIh3QPalKNid2T48=;
        fh=B1tfkgZCz3TnzfVED1Ib/DI/YKaa30MlmOCYKWHr1KY=;
        b=MSdfKtTU4+ThiQAb3H2xELgPUg81CDNElfgH0Clvj6zqPdm694z2QTBS105m7nj/N2
         +wK3ctFPgi+vqXTy6M9y+YyX00F43Wjh/wi2++ipbUgUf4Vp821Gcd8HpJF4yeV61vm3
         KP8rcgiL5P+sDfRrz1HDy7hgr5Zvg5PfcPGb504qr67kL/mupdurPNO+mLKiNWwLuJsj
         08NjFHwXAp5EV2UHGmukRqL98YRTXV2otWtLmbzCANTwy68519mxgsUHYa2AT4eh3+mH
         vmM7kiVkGehJ3en+rq9oE1Vn22aOju65p1uJIJbm5QUxSiXKjnM0HROOD4U57nEvhPcw
         1glg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792357259; x=1792962059; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opFHVg6d3nnPqZDxx8fTz6mfxSvEIh3QPalKNid2T48=;
        b=bYPUnOTS6aVQ7DrDUdsz6Wa68fBdTpjFtMEz5OxnOT3XXzT1sSiIejCsZMxwEcovQn
         KXc4fvAKCDrbfRnB1zNpFKddlqSNPJuxlFGDvgsDyiS7l9Qmu5wdPo4G8l91dnLKsE+O
         vH/0udXzmDFVpL9FzGjtLqiSx1VFmocaJ24NIwoopAOPmuUMa0+bj6cwW6d++SsjypwG
         FSHuaBADbnaEI2EHkbm+j6AkaYWKNqKER5f2V2PQk41BW00asNTwnaBOvMhiqCNz4Jg8
         hnJhIWYwfaTrefP+boCiEP4yUEwdnhG8QijpMHtB2+WBiVuZ/XSjTr6KuB13ipO/V4wk
         Vkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357259; x=1792962059;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=opFHVg6d3nnPqZDxx8fTz6mfxSvEIh3QPalKNid2T48=;
        b=R37ROaMDPc02lupMohAJUPfCi/TdfYaDTD7n5uZlpAEpT33SPGsbJxDWFoq6G1BKEr
         lCvomi4kyj1O5N/YyCJ4L2xAecgHATH0v18CEf3Kjuu6NiS62TdckZGh8WNJjF+gF9Lt
         gzRbYfxCNe/m8ma6g+TtU/5Xnz19At+uhiNMT8/sOP3buC+99jsW+sD3xDi3J5l1MEEF
         Oq8VplodzR1WtqLVKZY/+TzFY3b+AoiBCoNTtSFhwMKsrYF6YbrgXjxw/2hKpRFYYCJI
         x+pYJOld0BAN0nUyfnItrPKlp0R3UYlfNJ49nxbrvtu5iYDxgD++cZJAB2wtI1Vqq3XU
         dZwQ==
X-Gm-Message-State: AFq9FYKrPQwFGUjqrgTq0S7mzvk9b9k/EkeRQZx2qMSIjLrzSLkjiH5S
	Qud3Isg3c+IdC7I82JIQi5ZGENTZufYjTl5i+XdMXGxAPMtziNrnV3Zvj1qEcW7gTrEjS5ddR1S
	/1vD81s4ajbHCu39p5urIVNo7h86I2XdnKZB+/FfD
X-Gm-Gg: AYBFou3alPAA2L4/JZapckc7W02rYZEd8YgkaEdPnazSX66e22zLIvn/u25G1wIVU1s
	baOMgzULsMUZRo/NB17Cfymjy48gTX+5tIT4oagPWkC4umAUc8oVcT4benDKoDfhjfIc2Jb6hQh
	ti8JZJggqBFhp5LClklfORZ8j6XPRHsDKABzsSg29Q0T47oLj64jd1g5PAnmpd+3oM4e/Wfqw0R
	L5qz9efJ5AvnSYPv6WeaiceWraZ5ldKX1rPvot/XSsKZ+Occq558ey8YlYECPvjdkh09PVNvHk5
	njau3kwZR8LXjjx359krLVhecCTNzgZ5Tfr7PtqaPgR/Ay0grnWfSE0Twz7rij02F+jb7ZnguIZ
	4uWzhwv31voI=
X-Received: by 2002:a05:7023:a5b:10b0:165:aced:1fde with SMTP id
 a92af1059eb24-185079fd5b8mr8785323c88.0.1792357257877; Sun, 18 Oct 2026
 14:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202610181335.o2l6GmyB-lkp@intel.com>
In-Reply-To: <202610181335.o2l6GmyB-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Sun, 18 Oct 2026 23:00:21 +0200
X-Gm-Features: AclHuK_4G4yMRWt7OJnRD5FppBihEnhkkUdOgKX3BxCR-aC9l_unHDJ96jGjn3A
Message-ID: <CANpmjNOpJF+6DSjboR6TOq=WptnsS2VEiPVAP7HjLUqYjDG42A@mail.gmail.com>
Subject: Re: crypto/scompress.c:92:11: warning: writing variable 'src'
 requires holding spinlock 'scratch.lock' exclusively
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 13:43, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   32c52ec87d6245ee2d12ed5dd509e40062939b50
> commit: dc36d55d4e7259ff0f91a154744125ccc2228171 crypto: Enable context analysis
> date:   10 months ago
> config: s390-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181335.o2l6GmyB-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)

Unstable Clang issue: https://github.com/ClangBuiltLinux/linux/issues/2187

> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181335.o2l6GmyB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: dc36d55d4e72 ("crypto: Enable context analysis")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610181335.o2l6GmyB-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> crypto/scompress.c:92:11: warning: writing variable 'src' requires holding spinlock 'scratch.lock' exclusively [-Wthread-safety-precise]
>       92 |         scratch->src = page_address(page);
>          |                  ^
>    crypto/scompress.c:92:11: note: found near match 'scratch->lock'
> >> crypto/scompress.c:240:28: warning: reading variable 'src' requires holding spinlock '_scomp_lock_scratch().lock' [-Wthread-safety-precise]
>      240 |                 const u8 *src = scratch->src;
>          |                                          ^
>    crypto/scompress.c:240:28: note: found near match '_scomp_lock_scratch().lock'
>    crypto/scompress.c:242:31: warning: reading variable 'src' requires holding spinlock '_scomp_lock_scratch().lock' [-Wthread-safety-precise]
>      242 |                 memcpy_from_sglist(scratch->src, req->src, 0, slen);
>          |                                             ^
>    crypto/scompress.c:242:31: note: found near match '_scomp_lock_scratch().lock'
>    3 warnings generated.
>
>
> vim +92 crypto/scompress.c
>
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21   82
> c47e1f4142a3823 Herbert Xu                2025-03-17   83  static int scomp_alloc_scratch(struct scomp_scratch *scratch, int cpu)
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21   84  {
> c47e1f4142a3823 Herbert Xu                2025-03-17   85       int node = cpu_to_node(cpu);
> 2d3553ecb4e316a Herbert Xu                2025-03-15   86       struct page *page;
> 71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29   87
> c47e1f4142a3823 Herbert Xu                2025-03-17   88       page = alloc_pages_node(node, GFP_KERNEL, 0);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19   89       if (!page)
> c47e1f4142a3823 Herbert Xu                2025-03-17   90               return -ENOMEM;
> c47e1f4142a3823 Herbert Xu                2025-03-17   91       spin_lock_bh(&scratch->lock);
> c47e1f4142a3823 Herbert Xu                2025-03-17  @92       scratch->src = page_address(page);
> c47e1f4142a3823 Herbert Xu                2025-03-17   93       spin_unlock_bh(&scratch->lock);
> 71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29   94       return 0;
> c47e1f4142a3823 Herbert Xu                2025-03-17   95  }
> c47e1f4142a3823 Herbert Xu                2025-03-17   96
> c47e1f4142a3823 Herbert Xu                2025-03-17   97  static void scomp_scratch_workfn(struct work_struct *work)
> c47e1f4142a3823 Herbert Xu                2025-03-17   98  {
> c47e1f4142a3823 Herbert Xu                2025-03-17   99       int cpu;
> c47e1f4142a3823 Herbert Xu                2025-03-17  100
> c47e1f4142a3823 Herbert Xu                2025-03-17  101       for_each_cpu(cpu, &scomp_scratch_want) {
> c47e1f4142a3823 Herbert Xu                2025-03-17  102               struct scomp_scratch *scratch;
> c47e1f4142a3823 Herbert Xu                2025-03-17  103
> c47e1f4142a3823 Herbert Xu                2025-03-17  104               scratch = per_cpu_ptr(&scomp_scratch, cpu);
> dc36d55d4e7259f Marco Elver               2025-12-19  105               if (context_unsafe(scratch->src))
> c47e1f4142a3823 Herbert Xu                2025-03-17  106                       continue;
> c47e1f4142a3823 Herbert Xu                2025-03-17  107               if (scomp_alloc_scratch(scratch, cpu))
> c47e1f4142a3823 Herbert Xu                2025-03-17  108                       break;
> c47e1f4142a3823 Herbert Xu                2025-03-17  109
> c47e1f4142a3823 Herbert Xu                2025-03-17  110               cpumask_clear_cpu(cpu, &scomp_scratch_want);
> c47e1f4142a3823 Herbert Xu                2025-03-17  111       }
> c47e1f4142a3823 Herbert Xu                2025-03-17  112  }
> c47e1f4142a3823 Herbert Xu                2025-03-17  113
> c47e1f4142a3823 Herbert Xu                2025-03-17  114  static int crypto_scomp_alloc_scratches(void)
> dc36d55d4e7259f Marco Elver               2025-12-19  115       __context_unsafe(/* allocates @scratch */)
> c47e1f4142a3823 Herbert Xu                2025-03-17  116  {
> c47e1f4142a3823 Herbert Xu                2025-03-17  117       unsigned int i = cpumask_first(cpu_possible_mask);
> c47e1f4142a3823 Herbert Xu                2025-03-17  118       struct scomp_scratch *scratch;
> c47e1f4142a3823 Herbert Xu                2025-03-17  119
> c47e1f4142a3823 Herbert Xu                2025-03-17  120       scratch = per_cpu_ptr(&scomp_scratch, i);
> c47e1f4142a3823 Herbert Xu                2025-03-17  121       return scomp_alloc_scratch(scratch, i);
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  122  }
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  123
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  124  static int crypto_scomp_init_tfm(struct crypto_tfm *tfm)
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  125  {
> 3d72ad46a23ae42 Herbert Xu                2025-03-09  126       struct scomp_alg *alg = crypto_scomp_alg(__crypto_scomp_tfm(tfm));
> 71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  127       int ret = 0;
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  128
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  129       mutex_lock(&scomp_lock);
> 42d9f6c774790d2 Herbert Xu                2025-03-19  130       ret = crypto_acomp_alloc_streams(&alg->streams);
> 3d72ad46a23ae42 Herbert Xu                2025-03-09  131       if (ret)
> 3d72ad46a23ae42 Herbert Xu                2025-03-09  132               goto unlock;
> a32f1923c6d6e9e Sabrina Dubroca           2025-04-24  133       if (!scomp_scratch_users++) {
> 71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  134               ret = crypto_scomp_alloc_scratches();
> ddd0a42671c0d97 Herbert Xu                2025-03-15  135               if (ret)
> a32f1923c6d6e9e Sabrina Dubroca           2025-04-24  136                       scomp_scratch_users--;
> ddd0a42671c0d97 Herbert Xu                2025-03-15  137       }
> 3d72ad46a23ae42 Herbert Xu                2025-03-09  138  unlock:
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  139       mutex_unlock(&scomp_lock);
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  140
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  141       return ret;
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  142  }
> 6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  143
> dc36d55d4e7259f Marco Elver               2025-12-19  144  #define scomp_lock_scratch(...) __acquire_ret(_scomp_lock_scratch(__VA_ARGS__), &__ret->lock)
> dc36d55d4e7259f Marco Elver               2025-12-19  145  static struct scomp_scratch *_scomp_lock_scratch(void) __acquires_ret
> c47e1f4142a3823 Herbert Xu                2025-03-17  146  {
> c47e1f4142a3823 Herbert Xu                2025-03-17  147       int cpu = raw_smp_processor_id();
> c47e1f4142a3823 Herbert Xu                2025-03-17  148       struct scomp_scratch *scratch;
> c47e1f4142a3823 Herbert Xu                2025-03-17  149
> c47e1f4142a3823 Herbert Xu                2025-03-17  150       scratch = per_cpu_ptr(&scomp_scratch, cpu);
> 42d9f6c774790d2 Herbert Xu                2025-03-19  151       spin_lock(&scratch->lock);
> c47e1f4142a3823 Herbert Xu                2025-03-17  152       if (likely(scratch->src))
> c47e1f4142a3823 Herbert Xu                2025-03-17  153               return scratch;
> c47e1f4142a3823 Herbert Xu                2025-03-17  154       spin_unlock(&scratch->lock);
> c47e1f4142a3823 Herbert Xu                2025-03-17  155
> c47e1f4142a3823 Herbert Xu                2025-03-17  156       cpumask_set_cpu(cpu, &scomp_scratch_want);
> c47e1f4142a3823 Herbert Xu                2025-03-17  157       schedule_work(&scomp_scratch_work);
> c47e1f4142a3823 Herbert Xu                2025-03-17  158
> c47e1f4142a3823 Herbert Xu                2025-03-17  159       scratch = per_cpu_ptr(&scomp_scratch, cpumask_first(cpu_possible_mask));
> c47e1f4142a3823 Herbert Xu                2025-03-17  160       spin_lock(&scratch->lock);
> c47e1f4142a3823 Herbert Xu                2025-03-17  161       return scratch;
> c47e1f4142a3823 Herbert Xu                2025-03-17  162  }
> c47e1f4142a3823 Herbert Xu                2025-03-17  163
> 42d9f6c774790d2 Herbert Xu                2025-03-19  164  static inline void scomp_unlock_scratch(struct scomp_scratch *scratch)
> dc36d55d4e7259f Marco Elver               2025-12-19  165       __releases(&scratch->lock)
> c47e1f4142a3823 Herbert Xu                2025-03-17  166  {
> 42d9f6c774790d2 Herbert Xu                2025-03-19  167       spin_unlock(&scratch->lock);
> c47e1f4142a3823 Herbert Xu                2025-03-17  168  }
> c47e1f4142a3823 Herbert Xu                2025-03-17  169
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  170  static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  171  {
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  172       struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
> 2d3553ecb4e316a Herbert Xu                2025-03-15  173       struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  174       bool src_isvirt = acomp_request_src_isvirt(req);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  175       bool dst_isvirt = acomp_request_dst_isvirt(req);
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  176       struct crypto_scomp *scomp = *tfm_ctx;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  177       unsigned int slen = req->slen;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  178       unsigned int dlen = req->dlen;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  179       struct page *spage, *dpage;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  180       unsigned int n;
> 2c1808e5fe5afda Herbert Xu                2025-03-15  181       const u8 *src;
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  182       size_t soff;
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  183       size_t doff;
> 2c1808e5fe5afda Herbert Xu                2025-03-15  184       u8 *dst;
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  185       int ret;
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  186
> 2d3553ecb4e316a Herbert Xu                2025-03-15  187       if (!req->src || !slen)
> 71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  188               return -EINVAL;
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  189
> 2d3553ecb4e316a Herbert Xu                2025-03-15  190       if (!req->dst || !dlen)
> 71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  191               return -EINVAL;
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  192
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  193       if (dst_isvirt)
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  194               dst = req->dvirt;
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  195       else {
> 5f3437e9c89eec7 Herbert Xu                2025-04-07  196               if (dlen <= req->dst->length) {
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  197                       dpage = sg_page(req->dst);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  198                       doff = req->dst->offset;
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  199               } else
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  200                       return -ENOSYS;
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  201
> ce00897b94bc5c6 David Hildenbrand         2025-09-01  202               dpage += doff / PAGE_SIZE;
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  203               doff = offset_in_page(doff);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  204
> e3f08b262573187 Herbert Xu                2025-04-23  205               n = (dlen - 1) / PAGE_SIZE;
> e3f08b262573187 Herbert Xu                2025-04-23  206               n += (offset_in_page(dlen - 1) + doff) / PAGE_SIZE;
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  207               if (PageHighMem(dpage + n) &&
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  208                   size_add(doff, dlen) > PAGE_SIZE)
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  209                       return -ENOSYS;
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  210               dst = kmap_local_page(dpage) + doff;
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  211       }
> c47e1f4142a3823 Herbert Xu                2025-03-17  212
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  213       if (src_isvirt)
> 2c1808e5fe5afda Herbert Xu                2025-03-15  214               src = req->svirt;
> 2c1808e5fe5afda Herbert Xu                2025-03-15  215       else {
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  216               src = NULL;
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  217               do {
> 5f3437e9c89eec7 Herbert Xu                2025-04-07  218                       if (slen <= req->src->length) {
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  219                               spage = sg_page(req->src);
> 2d3553ecb4e316a Herbert Xu                2025-03-15  220                               soff = req->src->offset;
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  221                       } else
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  222                               break;
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  223
> ce00897b94bc5c6 David Hildenbrand         2025-09-01  224                       spage = spage + soff / PAGE_SIZE;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  225                       soff = offset_in_page(soff);
> 744e1885922a994 Chengming Zhou            2023-12-27  226
> 002ba346e3d76bb Herbert Xu                2025-04-21  227                       n = (slen - 1) / PAGE_SIZE;
> 002ba346e3d76bb Herbert Xu                2025-04-21  228                       n += (offset_in_page(slen - 1) + soff) / PAGE_SIZE;
> ce00897b94bc5c6 David Hildenbrand         2025-09-01  229                       if (PageHighMem(spage + n) &&
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  230                           size_add(soff, slen) > PAGE_SIZE)
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  231                               break;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  232                       src = kmap_local_page(spage) + soff;
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  233               } while (0);
> 2c1808e5fe5afda Herbert Xu                2025-03-15  234       }
> 77292bb8ca69c80 Barry Song                2024-03-02  235
> dc36d55d4e7259f Marco Elver               2025-12-19  236       struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
> 8a6771cda3f48a4 Herbert Xu                2025-03-15  237
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  238       if (!src_isvirt && !src) {
> dc36d55d4e7259f Marco Elver               2025-12-19  239               struct scomp_scratch *scratch = scomp_lock_scratch();
> dc36d55d4e7259f Marco Elver               2025-12-19 @240               const u8 *src = scratch->src;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  241
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  242               memcpy_from_sglist(scratch->src, req->src, 0, slen);
> 2d3553ecb4e316a Herbert Xu                2025-03-15  243
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  244               if (dir)
> 2d3553ecb4e316a Herbert Xu                2025-03-15  245                       ret = crypto_scomp_compress(scomp, src, slen,
> 2d3553ecb4e316a Herbert Xu                2025-03-15  246                                                   dst, &dlen, stream->ctx);
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  247               else
> 2d3553ecb4e316a Herbert Xu                2025-03-15  248                       ret = crypto_scomp_decompress(scomp, src, slen,
> 2d3553ecb4e316a Herbert Xu                2025-03-15  249                                                     dst, &dlen, stream->ctx);
> 2d3553ecb4e316a Herbert Xu                2025-03-15  250
> 42d9f6c774790d2 Herbert Xu                2025-03-19  251               scomp_unlock_scratch(scratch);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  252       } else if (dir)
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  253               ret = crypto_scomp_compress(scomp, src, slen,
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  254                                           dst, &dlen, stream->ctx);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  255       else
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  256               ret = crypto_scomp_decompress(scomp, src, slen,
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  257                                             dst, &dlen, stream->ctx);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  258
> 42d9f6c774790d2 Herbert Xu                2025-03-19  259       crypto_acomp_unlock_stream_bh(stream);
> 2d3553ecb4e316a Herbert Xu                2025-03-15  260
> 2d3553ecb4e316a Herbert Xu                2025-03-15  261       req->dlen = dlen;
> 77292bb8ca69c80 Barry Song                2024-03-02  262
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  263       if (!src_isvirt && src)
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  264               kunmap_local(src);
> a7b1d0c5f1ca05c Herbert Xu                2025-03-19  265       if (!dst_isvirt) {
> 2d3553ecb4e316a Herbert Xu                2025-03-15  266               kunmap_local(dst);
> 2d3553ecb4e316a Herbert Xu                2025-03-15  267               dlen += doff;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  268               for (;;) {
> 2d3553ecb4e316a Herbert Xu                2025-03-15  269                       flush_dcache_page(dpage);
> 2d3553ecb4e316a Herbert Xu                2025-03-15  270                       if (dlen <= PAGE_SIZE)
> 2d3553ecb4e316a Herbert Xu                2025-03-15  271                               break;
> 2d3553ecb4e316a Herbert Xu                2025-03-15  272                       dlen -= PAGE_SIZE;
> ce00897b94bc5c6 David Hildenbrand         2025-09-01  273                       dpage++;
> 77292bb8ca69c80 Barry Song                2024-03-02  274               }
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  275       }
> 2d3553ecb4e316a Herbert Xu                2025-03-15  276
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  277       return ret;
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  278  }
> 1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  279
>
> :::::: The code at line 92 was first introduced by commit
> :::::: c47e1f4142a3823b6e963e14db295a8a733804b5 crypto: scomp - Allocate per-cpu buffer on first use of each CPU
>
> :::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
> :::::: CC: Herbert Xu <herbert@gondor.apana.org.au>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
