Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C33054C7
	for <llvm@lists.linux.dev>; Sat, 18 Jul 2026 21:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784410932; cv=none; b=O48xooyZRDW8HyFhaDAceSlvtP8hQUntElgNKwSAL0cC/sLVqHfbzmx5r1TYQ/ZFUZAaP2K19+lTEog0ZPUeX6noLR3kPFD8FqLIKTUjeseIXTFv5nnBP9k/13qOE/DO/0/Kh1czMdjjcFeqxYXeCESArjjIM/Z5r1Uuo5VHhM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784410932; c=relaxed/simple;
	bh=N0fQqE9ytGgWnEFUp4Da9kmsZgr1z9bSK/MWpAvCFdU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JIIlguft+P0URSPYe29avatkGty1tHS9BokLBPTYdyQBw9a4/SqpRHBejKyoLiqFPjVvQI0Jkuk3ZAJG2Dvfs7hV0fdPhLeR+Ghl2DhYFRrW1DNcycta5z0gKIoT2vwYDGTEqqcHoirkVV+Z7bPZQGcqrU3/4RmGyptcaCcrlLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+pKyrYT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+pKyrYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784410929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B2tmXvsDlvAuQuJbLtqDlaFiZDxy9DuvWWN+UAjnNkA=;
	b=W+pKyrYTV+iulcK/KW8XkibnYTBGQx1YX3PShwewp0ZfYeB2eF/xg4H2ai/jPTVsVwhtvI
	Puv2rbZz8rEsLCNgHq54W0HHZ10/pb95H4V2oSDSPAzKgFotn4pgtyCHmvgC/w2O3VqsOn
	JoQ808Jsjhy1gPj+WATOY4r1IGbqAyc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-cHFZPtPBPjuaLcLSUC_odg-1; Sat,
 18 Jul 2026 17:42:08 -0400
X-MC-Unique: cHFZPtPBPjuaLcLSUC_odg-1
X-Mimecast-MFC-AGG-ID: cHFZPtPBPjuaLcLSUC_odg_1784410927
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 19D7D194510B
	for <llvm@lists.linux.dev>; Sat, 18 Jul 2026 21:42:07 +0000 (UTC)
Received: from [172.20.159.80] (unknown [10.30.44.85])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 52C4F158C;
	Sat, 18 Jul 2026 21:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc3,
 upstream-mainline, e22254e9)
Date: Sat, 18 Jul 2026 21:42:06 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <07536.126071817420800256@us-mta-665.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ULxxYs3nhz5RQCWjhGwfksS9fn7swe76NyTWK66cjdU_1784410927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'xfs-fixes-7.2-rc4' of git://git.kernel.org/p=
ub/scm/fs/xfs/xfs-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2682715229

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2682715229_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2682715229_aarch64_kernel_kcidb_tool_21658631_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2682715229_x86_64_kernel_kcidb_tool_21658628_9
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

