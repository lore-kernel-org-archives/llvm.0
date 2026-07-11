Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892612C21F7
	for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784533; cv=none; b=UC5DwDreuXdDWDXQv8mtf/G2ou8RLEnJFEQyTo4mdl6HIcIbbwvYN7iU/gnE++NMNmWeDJ74I59zhn/aJdSABSnbaiZni4124Kp3NPeUuKvh8VzCj06909URwoVgKvJb58RlV23QePxFMqThXXaXKIJ5Snbs8GZZOFhTlQwVGNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784533; c=relaxed/simple;
	bh=i6afbv0utEgx+s23THC5dNUNWsUE2gT70ARzSJEQF/w=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=M/Gz5YNP/XOSXhn1OCO96jfVLgoSiKXfCNygbU9KxgN3hqShIfHv24hL3F1kPA1wPs9c+sS9YPL4LCrpTQa0q/Jeb2/NSQegKxKvmhbUnmYr6n/1Tm+VN5GH8jIrO5Pfwr6AeBq10zmROUNavWhOiCzHtvrq/6tJwq+Eh4qIpI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JhZUOX/L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JhZUOX/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783784529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VihxL5zfazjF2qLWR5JH1CGStVdu/UpILcK0kyBVj+U=;
	b=JhZUOX/Ll5DWogmNVF44PwPTYDynvRLzcr34VvfmhNqJqTuGUREhWIspYzsqT8PVDu+1ig
	l87Hv3II8IyxXUKlrDKmZ6P30/74NHK+kcm4bX0q7s1QL48QHILfF9EQVYr2j6pkYmzv6K
	WsQs5o0cdCxVLovwt0NhRZSyp4eZiPo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-RuaMwgx_O--GJbdw_cDAgw-1; Sat,
 11 Jul 2026 11:42:07 -0400
X-MC-Unique: RuaMwgx_O--GJbdw_cDAgw-1
X-Mimecast-MFC-AGG-ID: RuaMwgx_O--GJbdw_cDAgw_1783784527
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEA2E1955F72
	for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 15:42:06 +0000 (UTC)
Received: from [172.20.146.15] (unknown [10.30.45.65])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 333F219560A1;
	Sat, 11 Jul 2026 15:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc2,
 upstream-mainline, dd3210c4)
Date: Sat, 11 Jul 2026 15:42:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <18330.126071111420700210@us-mta-641.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qZmfKTeM9DXQxFQoJcCYbkOKYUzn5fHg2pzPvy0aIQQ_1783784527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'regulator-fix-v7.2-rc2' of git://git.kernel.=
org/pub/scm/linux/kernel/git/broonie/regulator

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2669061663

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2669061663_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2669061663_x86_64_kernel_kcidb_tool_21622504_9
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

