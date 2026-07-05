Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F433993
	for <llvm@lists.linux.dev>; Sun,  5 Jul 2026 04:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783225391; cv=none; b=NVxS3lygwt51Z6gfJ7mXcMSfaq7TkD06uIXxZwO9WJ6B0if8UvOfG5srHLEDhx3HoU4uNaViaJwlgIq/Gpy9sCysGu4No7yp4FLbOUEJhoTzIaLHscPSiRWSPXCsVDXGOBrZSo4pOJOKuXeI8P35t3xiLJXXrbrYVbwYcCKlew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783225391; c=relaxed/simple;
	bh=EO/L8uROpFZNTSO6zEvP7ojN1jPGPfhLbm+u1rKxJvg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=bbtI7ekmHcdJtI5ekapu/8twkPW8p/BPp+VUvYCJm2bHDUo4tolMuI+TJ17p4MSh3PMU8ReqsFdv8Jg8I5N3cQP/S+EGoC9I8tQt3in//dR6pJzeK+SSC7IuSce1WlVa1UG9dl+2+cLvIq5bdzLZ6QPTQrupDDn0bcYiSNQbPrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LRecTo4p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRecTo4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783225388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uCibP9rYpoKpWUF1CIVWUEDs8SCU9DPUTMrRe7NRw6k=;
	b=LRecTo4ptRGoX8abKGwd2sejyuH1dn5Ih7os8cuDFvhMPwRiEF1ObrxzhvFVWRZxzL9Tl8
	G/QTTdT76DDCN5And/NJPmizC5o2vQeBspCVddyh2IloVEG9MT8pmCpVf/n+sKP/ccCe4v
	o2tb6ZCMOQTCn6OFB9ZTv+zkVRp8pyM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-FPH_2HRwPjWLe7mv9Nc8aw-1; Sun,
 05 Jul 2026 00:23:06 -0400
X-MC-Unique: FPH_2HRwPjWLe7mv9Nc8aw-1
X-Mimecast-MFC-AGG-ID: FPH_2HRwPjWLe7mv9Nc8aw_1783225385
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E76A195609F
	for <llvm@lists.linux.dev>; Sun,  5 Jul 2026 04:23:05 +0000 (UTC)
Received: from [172.20.209.159] (unknown [10.30.45.50])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 13CC3195608B;
	Sun,  5 Jul 2026 04:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc1,
 upstream-mainline, 7404ce51)
Date: Sun, 05 Jul 2026 04:23:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <86136.126070500230600143@us-mta-542.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JEqOXJe8SPPiXK4EeP44Na81Zbn89KHt0xWmUyakYvw_1783225385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 's390-7.2-3' of git://git.kernel.org/pub/scm/=
linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2651839883

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2651839883_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
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

