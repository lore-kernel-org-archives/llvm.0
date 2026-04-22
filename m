Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A754768
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867790; cv=none; b=Vj1qulv+BDkyJQK8L8t4q0ccdfecDHH8W/+Q1NSePI8pA2F+d+4AtblWQRoAccLtZknQTqykNu1DfQJbSsHqURLs7/ayok0kLiic0WxRR4IhLf+SiA32bgKR1b0EKuhwWQpHZ938yYw+BGnj6o1EqeLGPmEOiCkjAes3HUdZIWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867790; c=relaxed/simple;
	bh=QYSHcOHNwiRuJHwAufo7cs3vzNRKeQCGdq6vSodnxFc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=d4Lgr+tXFjZmJ7dd2qQM9YHok/hc39ZoDU/FJ8DbpN78d3NTc1vdJDj/Sj2xoRe5XDNqh2OvXFzv8OKT+8suNkxxW7yeFpZGwA5vqGiD4qqG1/HbOSr2IZbYA1fJ5i4YiVmQ0VnsP/nNft5IPBA4onf7NqAr4Z9bMuYnkTP95yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCG6Alc2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCG6Alc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776867787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/S+mhCvWi6tncM/heWj/wramlQ8Ad3JRiyJme5AgUNQ=;
	b=QCG6Alc28Gh25iELfjwpjBbIoEzEfadpCfAxEDwJZ+RdrxgmTsjOoSLfpsTFgsMBWTVEdS
	QVzqqy47jWRjQ3QMnsozm+4ZdEzn/RZA70QDiOyVFAYIhyLAqlCSQkQI90wz4V5OoyID5o
	MHoMN2dUic9+0PAXL08Soxy2iC6qpsw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-8wBCmZrONVWhLuXHpI45rg-1; Wed,
 22 Apr 2026 10:23:06 -0400
X-MC-Unique: 8wBCmZrONVWhLuXHpI45rg-1
X-Mimecast-MFC-AGG-ID: 8wBCmZrONVWhLuXHpI45rg_1776867785
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F597195608B
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 14:23:05 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D3E5180047F;
	Wed, 22 Apr 2026 14:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-0,
 upstream-mainline, 6596a02b)
Date: Wed, 22 Apr 2026 14:23:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <05498.126042210230602170@us-mta-618.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zGYQmfbseETn2-nf5P7HV9Ijvt31OADSjiEh4DRigiw_1776867785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'drm-next-2026-04-22' of https://gitlab.freed=
esktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2470041956

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2470041956_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
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

