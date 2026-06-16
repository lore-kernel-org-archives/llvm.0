Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981938C437
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781622788; cv=none; b=F2n0DEkIGHE847Qkau7pQlXR8qZEbM687kCM0madptmHM7t3tz+qabqOqWrrh7hNBtRloH5Zxn1oNLck7NfLnOw7LnTVUDXPdd+kFuqeD1EIbpedcCIhJU0NZp9DKinzRXXMdVeqUXRMFQqqdRewpDu22cli2G9UNmOqiH61UJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781622788; c=relaxed/simple;
	bh=MffqpUPb8/G8Crog3ecet17z5T+EyvYZfotYQ1jhqqM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WYkYAhgcYpTkELB9CB7O8yedl9sMoMnp96cBO3hcxbOJlLtz8lnIWHfwYtkdGEoiayojCdF8azTo/FejjUNMT9xdEsILyeWl8a0ZQT8L7OTn0753mvZH62WY5+r6lkFRqhE0fs/rHlnDDsVapVjjnRSHbi347XT6gmD38psZItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1vLv2I1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1vLv2I1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781622785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TufNsSwbsGMKMIdwcdv4arxM9jrNH/j/JzQ8T9EStl0=;
	b=B1vLv2I15MyNFgCP8292MGpWRanugR8e06Dui9Vco6SweLCHREsCw/AcD//HM+uhAjvgCA
	HdUqpiHk9aAifYR/ghxVeKTIsdUtXEmAm4D3zlwDzpkFc8SzVwYKE1TVT2A8ToRVPN51X9
	wQhfHPUynn3BySYsmxRSJaosRZhIl+M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-206-l5duFWwdMQqowGcjawrvjA-1; Tue,
 16 Jun 2026 11:13:04 -0400
X-MC-Unique: l5duFWwdMQqowGcjawrvjA-1
X-Mimecast-MFC-AGG-ID: l5duFWwdMQqowGcjawrvjA_1781622783
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABC4F1805C27
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 15:13:03 +0000 (UTC)
Received: from [172.20.180.65] (unknown [10.30.44.105])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2BFE21772;
	Tue, 16 Jun 2026 15:13:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, fc2ce3ee)
Date: Tue, 16 Jun 2026 15:13:03 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <64572.126061611130400967@us-mta-206.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mwEyjGlzGmfgavGJFwdbMd7XbUeRPuCzPG097t35_Yw_1781622783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'hwmon-for-v7.2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/groeck/linux-staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2603849622

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2603849622_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2603849622_x86_64_kernel_kcidb_tool_21470844_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

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

