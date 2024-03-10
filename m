Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A621FCC
	for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036336; cv=none; b=D1tgYiBwTcfvSa8XapJhJcXYGRfcmBrSAfcQFbVriX61bUn8BayISi1rhHOQRGwa+IhsGdZJ1awSGJbF3xbocTsDZg9mcih+CW7jnprSF9ELZwsNufblukcEGxaEClF8AdxFQ5H6eufotf0RVtXek+4JvjGqabmgE91f8zsn7dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036336; c=relaxed/simple;
	bh=ZSKBQS+8Mn7aJnZUbJUB/8XB7m9MXAj5PzIqShvjvqw=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=jdpgx8t0qSMOllIMCC4k6qsIyqyeNeHlsyIJKccnewg+NuuHrc6LV3IWHuemC39vNsNOmd8BYvIhmVl3zwyWzfZHvEkKeFsJWRq+tDSbKi5NdB1G97l90W2izCLhmVqbyW8p1YUtX//MFtRMt5VY/YEOTuBZ6nqSKta3sL3TF+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mdh/iVl5; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mdh/iVl5"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6b5d1899eso5900203276.0
        for <llvm@lists.linux.dev>; Sat, 09 Mar 2024 18:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710036333; x=1710641133; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1Gx+zOxHa5G/G1Me70ulKh3Qhwa8FiZyBNMKmpUzIM=;
        b=Mdh/iVl5Rt/nuoKjqtulbAndBnDI8R+gNmFEw5pEBkQryeb6YU7AR2s9dN+fxaJgml
         +MVmw3dvRkXe6QWMCz2XtAB5SxLMop3wJvWc4tFESaEc3vlItmTRR/dW1lRUWmM0uezt
         8n7vr+CjvGtxpz9mG7EFC+GUj1ISYsHUrdgpD9MDIy5j03oiD8RP2h90IvN3aAfn34Bt
         9XNTPCznkwmxADmcHp1WvRgtTeSUpgyuNvL31276Lx5jvyLhGQ+7GAOEd0wl2nkceqiu
         k8b1A4tPms0vtC4VXic4zRTlUA8o/HCWzE++9jj0AxGFwcf5JT6F4MwxINNnKGWka6jw
         GiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710036333; x=1710641133;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1Gx+zOxHa5G/G1Me70ulKh3Qhwa8FiZyBNMKmpUzIM=;
        b=lrX8NETMU+y16YuzShIC9cpoQRHU/FlNK9N/Dd8aF4fAlccP1W/LO+mCGPul+ME+xc
         Z/6nzxugwtqyrU96kFq/uRn1ngIW1kJgK1HDxwvEtq3UL9uJJJHoZZ+AMluXA01zruyI
         +Iq2vyH6I/0eVjT124EE7boNrJQJPBVu4MFgkuglTMXy5fDNOQtzqq7Zy7SVX+RJ/F5I
         AgMCjXasgchNwTaaxYk7bkNqnIriAhxh3+j+eCJb5bvxnvfueggwQ0v4Nrff4JxHz8HJ
         RalCU2hd34fEd5viFNOyg/+9IqYECRnzMnfpWR7qC441yr7noGZyTR0FK5+o2JXxEnn5
         7i7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLT/L4Z6zOfyAe+WZvZQoNQuMyYYIf655M4e18aHDu2QJVxwEa511d1GU5vC93MgLAQYSyg8LqPzBFDiBdbLJ/zpAHZA==
X-Gm-Message-State: AOJu0YxXlER/gtwJtIzSYrUfErcaNEmPEPqyrniI1nCUwoHH7l5lBy7r
	j/Vha1OxUnI51OpAKkdgHijNkvZlEt9flzG3OhUzNREucp9J2v6dSqb97LqOX2J2rAeVcnTTiFV
	H5mV4Bw==
X-Google-Smtp-Source: AGHT+IF4u5R6JlS2lv4g7BW2szOoJKeUuXHhe4ENBdL2Zr6Mgb8g7E49MW+hNNmJV1buj1jkBdxVOnRyOcxA
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a63d:1b65:e810:3ad3])
 (user=irogers job=sendgmr) by 2002:a05:6902:10c2:b0:dbd:b4e8:1565 with SMTP
 id w2-20020a05690210c200b00dbdb4e81565mr1091610ybu.4.1710036333476; Sat, 09
 Mar 2024 18:05:33 -0800 (PST)
Date: Sat,  9 Mar 2024 18:04:56 -0800
In-Reply-To: <20240310020509.647319-1-irogers@google.com>
Message-Id: <20240310020509.647319-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v1 01/13] tools bpf: Synchronize bpf.h with kernel uapi version
From: Ian Rogers <irogers@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@ACULAB.COM>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>, 
	James Clark <james.clark@arm.com>, Nick Forrington <nick.forrington@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, German Gomez <german.gomez@arm.com>, Rob Herring <robh@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Fuad Tabba <tabba@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Peter Xu <peterx@redhat.com>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Commit 91051f003948 ("tcp: Dump bound-only sockets in inet_diag.")
added BPF_TCP_BOUND_INACTIVE to the enum of tcp states in uapi's
bpf.h. Synchronize the tools version of the file.

To avoid future divergence add uapi/linux/bpf.h,
include/uapi/linux/bpf_common.h and
include/uapi/linux/bpf_perf_event.h to the check-headers.sh script.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/uapi/linux/bpf.h | 1 +
 tools/perf/check-headers.sh    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 7f24d898efbb..754e68ca8744 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -6904,6 +6904,7 @@ enum {
 	BPF_TCP_LISTEN,
 	BPF_TCP_CLOSING,	/* Now a valid state */
 	BPF_TCP_NEW_SYN_RECV,
+	BPF_TCP_BOUND_INACTIVE,
 
 	BPF_TCP_MAX_STATES	/* Leave at the end! */
 };
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 66ba33dbcef2..64dbf199dff9 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -6,6 +6,9 @@ NC='\033[0m' # No Color
 
 declare -a FILES
 FILES=(
+  "include/uapi/linux/bpf.h"
+  "include/uapi/linux/bpf_common.h"
+  "include/uapi/linux/bpf_perf_event.h"
   "include/uapi/linux/const.h"
   "include/uapi/drm/drm.h"
   "include/uapi/drm/i915_drm.h"
-- 
2.44.0.278.ge034bb2e1d-goog

