Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A0F34B434
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 21:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696730; cv=none; b=RTfol9cJHu43cXjYx/2fqjOi+u4ZLAD04RRyzSTWxmcw0fiewVI7jDr/6/Ugx+bs8FcVqe3UecbPPe+X4ECkxgJTnckzHq5qnVG1Wklp6w6NQIJXbdgMTK9AHSDl5gkIKeLxilfUneFTNSG21J82E8j8s6MpbqTtzz2crbxHZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696730; c=relaxed/simple;
	bh=ig8N08sFe4k4zuCSz+AizD6mtPMlNa1S0kWNgGwpqzc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lFwxrFmUFzZfoeAsbFOFgCI7Up90xFzY1l4K2pmSwmuAtHDtvcsdyhiigmNNwqZm6NHMy/MBkIEpN9UmZl6zSupmsLBgfIzBoZpMrBmjiLI8TNxWuEqcM1QUo0pDYoYaAlK7vLR6EeNxaXAwDV+6F/4ATb9l/vauU3wVFPbaRpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K8IcElZ2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K8IcElZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773696728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9X47QfvhEbp0b0iTxMgf8B3pz/dxqs+3X1vCttTf5TI=;
	b=K8IcElZ2QABIMNgpUgq1B5zBtlqZJfY8gsjuIC2e4eVzsNy1tHQzmcXmjdHB+hKutBGA9F
	4znM6SoM6opx17+Ai5/ZloAXM7A+DZdWCsW7rR4zNy27COzFxEPqbaYEA2lN2D4BAP8Wzr
	PWPVXKkVI0sf9QNNnQ93XQuSGRE0J/c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-Ur41ZDXmMKWEBme9MBSrDg-1; Mon,
 16 Mar 2026 17:32:06 -0400
X-MC-Unique: Ur41ZDXmMKWEBme9MBSrDg-1
X-Mimecast-MFC-AGG-ID: Ur41ZDXmMKWEBme9MBSrDg_1773696725
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A81411956056
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 21:32:05 +0000 (UTC)
Received: from [172.20.219.202] (unknown [10.30.44.44])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 390383000223;
	Mon, 16 Mar 2026 21:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.0.0-rc4,
 upstream-mainline, 2d1373e4)
Date: Mon, 16 Mar 2026 21:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <55635.126031617320600613@us-mta-204.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V22DQRdchyT1oSWEWR3h8AMzddGYHL0nCuMTEXxvlKg_1773696725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'for-7.0-rc4-tag' of git://git.kernel.org/pub=
/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2388762997

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: selinux-policy: serge-testsuite: /bin/sh: line 1: ./scripts/=
recordmcount: cannot execute binary file: Exec format error
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1507
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

