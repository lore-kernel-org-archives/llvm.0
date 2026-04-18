Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F124254AFF
	for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776511930; cv=none; b=FfPi8d8/EpZRvub1jvsH08G8ejAXZGL3d0arwmRmb/n/p0wFjr0Bh6xN6OTzL/Fq4FVQhIHmh6//VOtxsJv+xJ9sDZ3Xj/jjkg4oMljNv5Wi3ga5PptJRUAYnvGQL/6qf94dr4ZqMzf8ymZq/wveQicheRnC+MSgUWXwaB40620=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776511930; c=relaxed/simple;
	bh=qLczLqif4N3p27btKbgY4HAuMui+BDf4VDj/4JgPVkc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Xr6vJtx1OeIaXmPJ9CpnoP/Gv//tMpt5bcM5A9mXK8BAi0aZOLOwshJmaNtJ8rUDRXWzAU/2nFlXyG+OS5Dbr+ZukMm0P9Ws/ar6XkwFbbWZyw5CofDPTRUcumZJHAnNTdm4egUZaRmdol+AdT8D36uCkrseZcXLcqpt9ZuNOvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zd308jBh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zd308jBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776511927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c3FZxGFO42DjQXVvYSuDNs7DkU4WtsQgLZmQ/UYMhjc=;
	b=Zd308jBhL9irGy8Z3T/7qzSI61zkkAF8NcDdFoXJdjsnXxQfs7fCfHF7gQsjxJYVmcTicn
	EYak5fq5Ph+MAmEa0pcItH8bd97tDKAtdz9lPP8v1aV7GQ9ls+athgIo0+Dpv6hNbIJ3UQ
	4L5gqGh1mUqncOZ+tgWiIucOKo234mk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-83--fwj4LsKNY2-bJGNJJSR8Q-1; Sat,
 18 Apr 2026 07:32:05 -0400
X-MC-Unique: -fwj4LsKNY2-bJGNJJSR8Q-1
X-Mimecast-MFC-AGG-ID: -fwj4LsKNY2-bJGNJJSR8Q_1776511925
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C8451800352
	for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 11:32:05 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B136619560B1;
	Sat, 18 Apr 2026 11:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-0,
 upstream-mainline, a436a0b8)
Date: Sat, 18 Apr 2026 11:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <48607.126041807320500297@us-mta-83.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OW6oSRBd74fB9wrB5krGFKqVPr2SZYh6tVWXtwUjREI_1776511925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'ext4_for_linux-7.0-rc1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/tytso/ext4

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2461898509

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2461898509_ppc64le_kernel

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

