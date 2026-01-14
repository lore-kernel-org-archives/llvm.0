Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B63344053
	for <llvm@lists.linux.dev>; Wed, 14 Jan 2026 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388607; cv=none; b=ggJ6tDAGk8oz+LBJg/y4uLKZXomI6fxqheYv4w9mxkbmLMNdlqzEGPpv+hZf1B5CpY9Ww+RdGBzE6+4pwVd3QaICxFgClZx66Xfep5yodHwL+Hybc0kV2zpKz4DyZVUAglK/p4CNbOrtDyLpOujey69xdh8p8IrVSPSmYt+8ng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388607; c=relaxed/simple;
	bh=GvtxZp6TjhNCeN3HfELvv5o3JZk5/lWZS357Fn7BCEA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=W1PTzKfn1vQPqKWKyHGnUWAJcZq8HT3+HzkYmpefx2fv/YzYpQR6SnXIali3vPcwkkPC4mWPufVj3nMua6eC/N4ijJiY0RzORXFoCBVGLQy6tGqOJz1oeK9/ce7uXiogVzZye8fm1B0dXGXLTzVLew/szbPb/Xh4DayNyevpdY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1hIb76B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1hIb76B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768388593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QfHF1aMZu8OdM5vMD0vXDn0KqJxkQn/j0XIkOyxbqJ8=;
	b=Q1hIb76Bra+dbId9K02/bedQ03XyKigKvLQwTyxDbIDmHMbvJo6MqZOcgQu/HyIHkg1NJN
	L6M2uIlxgsWy6d/RuScbBSQi6EpJS+zs9g/lE9adUFPgZEiPnNVh0C6jIeqpQOf//gJPs3
	jl1nBOaED0C7DuMgm+uwdwYmEpGbYS4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-l5R2jhxaNI6ltzJpBLFiXw-1; Wed,
 14 Jan 2026 06:03:12 -0500
X-MC-Unique: l5R2jhxaNI6ltzJpBLFiXw-1
X-Mimecast-MFC-AGG-ID: l5R2jhxaNI6ltzJpBLFiXw_1768388591
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 738AE19560B5
	for <llvm@lists.linux.dev>; Wed, 14 Jan 2026 11:03:11 +0000 (UTC)
Received: from [172.20.95.168] (unknown [10.30.44.183])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1BC901956048;
	Wed, 14 Jan 2026 11:03:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 81 of 110): Test report for master
 (6.19.0-rc5, upstream-mainline, b5434592)
Date: Wed, 14 Jan 2026 11:03:10 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <28197.126011406031201521@us-mta-653.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s6heYhlzu3aEUuKZUWNKZS29ICYtxdqd7anAcdYRYEM_1768388591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'gfs2-for-6.19-rc6' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/gfs2/linux-gfs2

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2261014202

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2261014202_x86_64_kernel-debug

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, x86_64]
    /distribution/command [aarch64, ppc64le, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, x86_64]
    Boot test [aarch64, ppc64le, x86_64]
    CKI/restraint [aarch64, ppc64le, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

