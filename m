Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8C221FCD
	for <llvm@lists.linux.dev>; Sun, 28 Jun 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782638589; cv=none; b=nOuqnuzHAn1GWw0Of2E/QikfwAQXNJd09mvMDweU64CFyR/oU4nAmg72FWM4M2sniBIABbctqYuxdma3j2wNyEaRPxdmbBK4clq6etnJk5J2wnGcBsFX6exk9y010HDYS7mNOt7J1tFvLy/TYvbpkG2ISp0w4gOzPmIvCWFCKYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782638589; c=relaxed/simple;
	bh=3uvPDrbQR9Wneg8aw9gcBk457GvoEhhnqZfxpmXiANY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BlFuU16YLtbgOdRlQvDsBNvuJ+dLTK2xzZWc7AQ1YtErIUyyoVTEScNEQFGy5F7xyO/XezQsXI/7n+fvosyM1qHM+hmWSJohY6wbXcrDj2esYYdFD6OFjIEmD/jWtd9BfZCU8zTEDjvUwEHQiclJZwrAdHX8UO8JmStfGfY8TLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DXAE95ub; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DXAE95ub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782638587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ij4AsL23QF5kzIhSEDt+c7cLh68BrDr4H+dZIsZrdfg=;
	b=DXAE95ubLED/ZO8rhSup1ANA2BPAM5l6VYTV4FJXruOtJXamadpEYQQfaq+0d635umXqAr
	lgqPLTk4hHa20jj4Kj6YqtDptoMFowsBx5vn+a4QAPnGuCWXveUG59jN3TfR95JEPjv/io
	8vGQK3J8hsVCJm5y8MiQiwA/ObO0tXU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-RxPHZlhVPMaN1noIv3pGFA-1; Sun,
 28 Jun 2026 05:23:05 -0400
X-MC-Unique: RxPHZlhVPMaN1noIv3pGFA-1
X-Mimecast-MFC-AGG-ID: RxPHZlhVPMaN1noIv3pGFA_1782638584
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98448195605F
	for <llvm@lists.linux.dev>; Sun, 28 Jun 2026 09:23:04 +0000 (UTC)
Received: from [172.20.60.60] (unknown [10.30.44.61])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C12B71800480;
	Sun, 28 Jun 2026 09:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 780d569e)
Date: Sun, 28 Jun 2026 09:23:03 -0000
To: omosnace@redhat.com, mmalik@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <85735.126062805230500100@us-mta-368.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bplZLJFCo54_EpEjWi9eJHM_SsjAa_M7xZLRW4YTe9A_1782638584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'pwm/for-7.2-rc1-2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/ukleinek/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2634282430

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2634282430_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2634282430_aarch64_kernel_kcidb_tool_21538475_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2634282430_x86_64_kernel_kcidb_tool_21538478_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2634282430_s390x_kernel_kcidb_tool_21538472_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test



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

