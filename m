Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0FD2F1FEA
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 06:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780726332; cv=none; b=n6pBBOGZf8mgk/1LrLa+Ql946oksWxuKrziHGEEoRCb1yT5pKtV+QSery2mUv+S2AGybguT2yyVEqHin8F2Pu8Z/0FKVyvyANXHO6nO5je0n3UNx0wuAtGhTvqJOqQlln9lZHoXXnC/8kh19NogEuoQ/pFkAdnJ2mv27zgybHuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780726332; c=relaxed/simple;
	bh=UL9X3l/5w72gGCaaPxJOkePHOrg/dOgKg5xv1nEFzqQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WzJdP6EV29S+bxAEjWI/nWBhpxlWLguJcj30ziHh5SI2+RiST3Xq7/0dCHagHdwcB9RcSTK3DIqM0KEdgGWVbifQLExdFF9PrZBKffqk2ugsQ6/zAtBOauVmHHRApLM8r0G3G6t4ZfhP01XgyDDxYY9aADedxsduEGBEHtRXWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjZrTS9O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjZrTS9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780726329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ig9IgOivHTTYDOwF6BATRZf1h/BqWcj6l7opNNZhdWo=;
	b=RjZrTS9OXbI/qdxfa85we0elmAPWeREJ0hU72QxKAuRMsMq7xMr1SFOkufiEYr4BiqOPqA
	6LDFXfnwaOudR5kANlkzRI3qCn6HARmEvz1pdoR82AS+QAvj+cPqVbDXITAfgSEmKfGy+i
	MXsLQdkcwwBbNQWTIjROutyNRMXTgPY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-xjPx2j8dPHOcWN3uhrrdmg-1; Sat,
 06 Jun 2026 02:12:08 -0400
X-MC-Unique: xjPx2j8dPHOcWN3uhrrdmg-1
X-Mimecast-MFC-AGG-ID: xjPx2j8dPHOcWN3uhrrdmg_1780726327
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 686861956089
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 06:12:07 +0000 (UTC)
Received: from [172.20.220.30] (unknown [10.30.44.120])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0528A180034F;
	Sat,  6 Jun 2026 06:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, 06121e12)
Date: Sat, 06 Jun 2026 06:12:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <59343.126060602120800295@us-mta-461.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BvU7Y1mrXeFLLYwbQMz5N9iZtf24sNv5OCOD9YZvu6E_1780726327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'kbuild-fixes-7.1-3' of git://git.kernel.org/=
pub/scm/linux/kernel/git/kbuild/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2580216737

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2580216737_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

