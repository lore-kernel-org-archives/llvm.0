Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40993A3E60
	for <llvm@lists.linux.dev>; Mon, 22 Jun 2026 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123130; cv=none; b=dcXLOifDU5k7Z/3RNRVciP7LOVV859QlzHfH2mA829W0OaZLfG9vjMu92Q1QOtOYjO8+ZpG8ZgvjM4gv6TyqrbD7O+XMamHepDocyVDAnIkWIn45qIAaGsoe1jAjxzI65Sg5aCrrskS4w5X0+vz9FtGXV0e09wovFRcCxPV2omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123130; c=relaxed/simple;
	bh=MTjm18d1ksMl+UkcCVpcY52jclTDJ7Kgk74ItdgHl0s=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UzLmY1vAu/R1tg32o3EszNFJXXTtli3Rmil0vvn+I0O1eG+qN8nMjn56MqhJrleOuGWVOwbGpSJTXnDsZbJ/kDdmxbHfueWAugznyYBABO46JJ8Y5RkYp+D1LkcQwSbH/4FuM2f7/1itis53kziwAc3ww0eDGoIQ2pVCSqbyfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c7Nj4I6F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c7Nj4I6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782123127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lsm6oFQNENBm0Sf9fW8D7GGgKjjPRfdfKw22K4WVCR4=;
	b=c7Nj4I6FB8ymIBbwtFDrncO2CPwVT51VMuEI/gvPnqSnZDjrAnfN4LrB3voLP6KhavQ8G2
	BmKl0ruYy6DATc43NUclAYh92T07oWFUSSbO7idkA9tot98674tToAg3gNwrpA4RX1bkej
	oN2mXPcU1JQsGciFr0V+NGqJrxj/cM4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-327-HzuWLrs1MfWNbHyapZIHHA-1; Mon,
 22 Jun 2026 06:12:06 -0400
X-MC-Unique: HzuWLrs1MfWNbHyapZIHHA-1
X-Mimecast-MFC-AGG-ID: HzuWLrs1MfWNbHyapZIHHA_1782123125
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9224E1956094
	for <llvm@lists.linux.dev>; Mon, 22 Jun 2026 10:12:05 +0000 (UTC)
Received: from [172.20.158.179] (unknown [10.30.44.85])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2BAE718005A0;
	Mon, 22 Jun 2026 10:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, ef0c9f75)
Date: Mon, 22 Jun 2026 10:12:04 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <91117.126062206120600387@us-mta-327.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pwhs5T_l7-8Jtjw26TpOgwDeGlHw-eGBoIifFVAk3tw_1782123125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: lib: Add stale 'raid6' directory to .gitignore file

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2618076002

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2618076002_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2618076002_x86_64_kernel_kcidb_tool_21500679_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

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

