Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1F309F00;
	Tue, 16 Jun 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604907; cv=none; b=OZxlUQSOALqm+kmlocQPZ3yZ+dRhpFG5LEvctuKjdOCONtbG+WYAm6yZeNS93q+CilhNkBTnrJnb0PUZ1iZ13crSiXpcbsksFIaVb+ozM/mOZuU0YLrRIrUg9nz/i90Z+bvl+uz1dxKBvOVccWxLCLX6rahND2k4ZoEq6fxCTqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604907; c=relaxed/simple;
	bh=GidBOj9Rf3rkLVbDol0Gcjf4a5oTARn+s/4uawaVoIQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=sTA1NGPQQrTc3G97Gfs1NFFHFeQ9DL9zfg9iLJnKZDP1oca3AXg7w3IWRsrPzuXrjnbtQLX4Owo+tX/Y2yKpnT7zq6VMfEEq1PqESJLea3o7bvpDjTJcBL041qr7fdlqWwjVXBS0IZWTsPcuhWO7zUfiwU/HzcDA+YSdcWmwHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IklcBQAl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IklcBQAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114901F000E9;
	Tue, 16 Jun 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781604905;
	bh=Df6PSlB7tz9mMkQWxSLAK9kI5ldBQ3tso1DCNAXPSoQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=IklcBQAlOPJw9ANytV7dKoONPn3IpmeoWEeHjV6uBSjzpH7Hn++0lO1Vcup6vJrk+
	 QAA9eR422XTZlHdJfFVsSoN5p/0Y3UIXGE4xzatohWTBoGhPQ+YGBH+n+tzZMiCgP/
	 FPMzY2WxLTpX7PpmAmVNiTnz9/bHAZ7rlx7qZc8o=
Subject: Patch "tools build: Add 3-component logical version comparators" has been added to the 6.1-stable tree
To: acme@kernel.org,acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,bcm-kernel-feedback-list@broadcom.com,florian.fainelli@broadcom.com,gregkh@linuxfoundation.org,irogers@google.com,jolsa@kernel.org,llvm@lists.linux.dev,mark.rutland@arm.com,mingo@redhat.com,namhyung@kernel.org,nathan@kernel.org,ndesaulniers@google.com,peterz@infradead.org,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 15:43:45 +0530
In-Reply-To: <20260520163320.3073037-5-florian.fainelli@broadcom.com>
Message-ID: <2026061645-hastily-hazing-4bb0@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    tools build: Add 3-component logical version comparators

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     tools-build-add-3-component-logical-version-comparators.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-250208-greg=kroah.com@vger.kernel.org Thu May 21 01:09:09 2026
From: Florian Fainelli <florian.fainelli@broadcom.com>
Date: Wed, 20 May 2026 09:33:19 -0700
Subject: tools build: Add 3-component logical version comparators
To: stable@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), linux-kernel@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), bpf@vger.kernel.org (open list:BPF [MISC]), llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT), bcm-kernel-feedback-list@broadcom.com
Message-ID: <20260520163320.3073037-5-florian.fainelli@broadcom.com>

From: Arnaldo Carvalho de Melo <acme@redhat.com>

commit a9b451509565d40a5ca3b41c39a2b758cdbc5355 upstream

The next cset needs to compare if a flex version is greater or
equal/less than another, but since there is no canonical, generally
available way to compare versions in the command line (sort -V, yeah,
but...), just use awk to canonicalize the versions like is also done in
scripts/rust_is_available.sh.

There was a problem spotted in linux-next where a bashism, here
documents, aka the '<<<' stdin redirector, for strings to be used as the
stdin for awk. Use $(shell echo | awk ...) instead.

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/scripts/utilities.mak |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

--- a/tools/scripts/utilities.mak
+++ b/tools/scripts/utilities.mak
@@ -177,3 +177,23 @@ $(if $($(1)),$(call _ge_attempt,$($(1)),
 endef
 _ge_attempt = $(or $(get-executable),$(call _gea_err,$(2)))
 _gea_err  = $(if $(1),$(error Please set '$(1)' appropriately))
+
+# version-ge3
+#
+# Usage $(call version-ge3,2.6.4,$(FLEX_VERSION))
+#
+# To compare if a 3 component version is greater or equal to another, first use
+# was to check the flex version to see if we can use compiler warnings as
+# errors for one of the cases flex generates code C compilers complains about.
+
+version-ge3 = $(shell echo "$(1).$(2)" | awk -F'.' '{ printf("%d\n", (10000000 * $$1 + 10000 * $$2 + $$3) >= (10000000 * $$4 + 10000 * $$5 + $$6)) }')
+
+# version-lt3
+#
+# Usage $(call version-lt3,2.6.2,$(FLEX_VERSION))
+#
+# To compare if a 3 component version is less thjan another, first use was to
+# check the flex version to see if we can use compiler warnings as errors for
+# one of the cases flex generates code C compilers complains about.
+
+version-lt3 = $(shell echo "$(1).$(2)" | awk -F'.' '{ printf("%d\n", (10000000 * $$1 + 10000 * $$2 + $$3) < (10000000 * $$4 + 10000 * $$5 + $$6)) }')


Patches currently in stable-queue which might be from florian.fainelli@broadcom.com are

queue-6.1/perf-build-remove-wno-unused-but-set-variable-from-the-flex-flags-when-building-with-clang-13.0.0.patch
queue-6.1/perf-build-conditionally-define-ndebug.patch
queue-6.1/perf-parse-events-make-yydebug-dependent-on-doing-a-debug-build.patch
queue-6.1/perf-build-disable-fewer-bison-warnings.patch
queue-6.1/tools-build-add-3-component-logical-version-comparators.patch
