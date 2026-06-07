Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938E2F361E
	for <llvm@lists.linux.dev>; Sun,  7 Jun 2026 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831391; cv=none; b=S5CwMbxqFD4zIPrm83VMHtuh2AH9jSARcFYMGMG1U+A8LFJmGwlI5Dci+j4U06wtd1W0Th2LiUfola0grKFAC/4racIfprbywGuad0GRj4PEigsvQmzPaC5B5CFNCHRVQYCKjWB4sTdh49Ek/W7glLIP7RVEHsIoECALkk4+4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831391; c=relaxed/simple;
	bh=4yTngwWvHABqysAyL+KTwi1RND6b8/8+5tN1F3bQqBc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eiejb0MqGh/Il2zEJTz4xKGJx5+WReivybwIkdVWzyOG+xhzj7tFSolUTW1fFA4YzKmMx9QO9OTM1D4gyOJxVnsYATEUtRIlrTWry919m40NKNxzmJKCbwBznh+nC80KuZOZbR7rcFmCCH22NUy3NtN+Ee/hmyy4Ob+pQo2skBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWl/pbKJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWl/pbKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780831389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s5YY2wzhhF+/SSjNEYbtilGdsZUJH9N3yeOTmJrDy8U=;
	b=KWl/pbKJnotT0cV829Ge/l7QJqHR+fvuSX4WM1Ei2zjbUuW/emue19zgU9m15OUG8mwK75
	mw50tF8Nbn3b7gEup+pIh+0cQuKmriePQYUQE2diaWWOxHkDrq4pZ1wd1wsUukSnhxQOgO
	SJHAonZKT6c4ZFwPMd1q2xDMZbEz6JQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-2p0Xs9cWMlWjpQn9ttkICA-1; Sun,
 07 Jun 2026 07:23:08 -0400
X-MC-Unique: 2p0Xs9cWMlWjpQn9ttkICA-1
X-Mimecast-MFC-AGG-ID: 2p0Xs9cWMlWjpQn9ttkICA_1780831387
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 398091956089
	for <llvm@lists.linux.dev>; Sun,  7 Jun 2026 11:23:07 +0000 (UTC)
Received: from [172.20.145.56] (unknown [10.30.45.118])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB145763;
	Sun,  7 Jun 2026 11:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, 979c2945)
Date: Sun, 07 Jun 2026 11:23:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <61768.126060707230800114@us-mta-644.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f7xR1UaD8r3RqjIpET8lRWcXHBkez_mHJdAdTnZ4tCU_1780831387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: cfi: Include uaccess.h for get_kernel_nofault()

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2582292383

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2582292383_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: xfstests failures generic/32{6..8}
            URL: https://redhat.atlassian.net/browse/RHEL-50644
            Affected tests:
                xfstests - xfs [x86_64]
        Issue: mkfs.xfs prints warning about invalid stride unit, hardware =
specific
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1924
            Affected tests:
                xfstests - xfs [x86_64]
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
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

