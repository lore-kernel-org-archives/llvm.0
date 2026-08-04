Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1042A442B13
	for <llvm@lists.linux.dev>; Tue,  4 Aug 2026 23:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785887603; cv=none; b=QNsqQCgNPoKJSCRY1fuGfPaaCi+6Vp9YaCWIvUz6yImzz/Lxm5MF+aCflKFHxs83e2RlUuQwvMayQbBFmxAH1O5S/fx4HyQi5dBfia2W00n5QFdRotV+JqK8+WMia4FE/v6EEc5S4j8J3auvYa1U47QufaHrr10GH6Eyb3dFC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785887603; c=relaxed/simple;
	bh=JmAEggYoKQiq7ZAD2KxAk+ZcbfpFkG/HpJkMhXugw00=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=dBLf08RdkLwuKgCnZQrwxpyR1xlxIGGlY3Mhk2Qnk9fwFmmM4+w1UZQZR09Gb4E6OJRcg0EsUHBjcFPH3i9aBr9ofdvMAmg4EflJliU0bopuPnu0weVljGw03fHfZX+aK30uHIdHSh33Fzce/jwjW7LzcV1HcL/jZZqD0H1jG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MtEApvHZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MtEApvHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785887600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KQueCNqJuprkqMHsC/urRYzMm8LpubMVZtJIDc4OCx8=;
	b=MtEApvHZvMO3i0Jj7AqJFcB5Y5+xmoNoS6ibFGAvSTusMFuIWI677kHD5OzlIrQrboinJ+
	ilvyTpJ1Vt/uIVlrgyw5MZ6/KqRIJSRyAV/68fMtq9ZsEEXhyL2CtjhWNRPJEqriPD8HAs
	1rMQNP9265xqZM5LAOgHuKhd1aOo0mY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-wV3TN-jtNUOYY2H8RC1uOg-1; Tue,
 04 Aug 2026 19:53:07 -0400
X-MC-Unique: wV3TN-jtNUOYY2H8RC1uOg-1
X-Mimecast-MFC-AGG-ID: wV3TN-jtNUOYY2H8RC1uOg_1785887587
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB8711956089
	for <llvm@lists.linux.dev>; Tue,  4 Aug 2026 23:53:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 237CD18004AD;
	Tue,  4 Aug 2026 23:53:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc6,
 upstream-mainline, 31996e14)
Date: Tue, 04 Aug 2026 23:53:05 -0000
To: llvm@lists.linux.dev, fs-test@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <18497.126080419530700529@us-mta-372.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fgpeHQWKmTt5agi_D-4JvBKLxXq1NCGfEm40nMDEqTo_1785887587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'locking-urgent-2026-08-04' of git://git.kern=
el.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2731709279

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2731709279_x86_64_kernel_kcidb_tool_21796094_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

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
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

