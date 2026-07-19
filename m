Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F169280329
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784451791; cv=none; b=uqgC4bsKTvLrDwPetawE4FnFpgHq7t1B9ZhCDzBEx58zwQUxVIFyK1wBQWnBATfw4rxxApzPDq4qxjsCkogDaESxmMZ7GOC8rUKG51pgZZZgrHARJIFsa5SuJ++21Eoh6olOksoaNpT9yYJg0VFPAZ3rorymoolrbxAombi+Vgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784451791; c=relaxed/simple;
	bh=nVfHIstNOrB4ImFPkBVVPmnrkZXBn64JKcE9t3e6WRY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MK3449COJZU0R8Cv79CXOJBLZ50oL9gXfP2mVsoKBJXytl9pz1Zb3LhL0jxv+JyBNGRo/1QmXVfHxDFARLTm/mmaavhhR7VkUPGN1jtsRvzATVptvsuyaKzATsLaduWOoX4hKe1nk4RfBuDoC3rj2RVt9mApabuAD9fi+v022j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MnYISCOG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MnYISCOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784451789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2/SY+igynH+H7AlokVYLsWQeucp3J1Kcn0d2epUe8/4=;
	b=MnYISCOGkHdrQgKyiYTh8jI2K9698zdfHREzzsS/fUsN7KVCcws4rqxbAFAeHkWFEp02Aj
	V4/KIoRtF2TZoXuj7/Y9ap4ziRfLrVdYQUwYo374sjyJMoxvD7BwYlZf5OAfOn/LpAh/cF
	YFQN92B+abgKtszfCwv+EEawouombIw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-dxIy9FEwO52eXNuroQrh3w-1; Sun,
 19 Jul 2026 05:03:07 -0400
X-MC-Unique: dxIy9FEwO52eXNuroQrh3w-1
X-Mimecast-MFC-AGG-ID: dxIy9FEwO52eXNuroQrh3w_1784451786
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61B9F1955DBF
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 09:03:06 +0000 (UTC)
Received: from [172.20.159.80] (unknown [10.30.44.85])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D9D351954229;
	Sun, 19 Jul 2026 09:03:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc3,
 upstream-mainline, 111e7b23)
Date: Sun, 19 Jul 2026 09:03:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <84704.126071905030700391@us-mta-191.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6VZ4lLN0yZdEoPYjMG2TnkXUJbFw7x6P_nwg_myrlLE_1784451786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'soc-fixes-7.2-1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2685573944

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2685573944_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2685573944_x86_64_kernel_kcidb_tool_21666787_9
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

