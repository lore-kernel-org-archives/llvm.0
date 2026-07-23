Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6766B488D87
	for <llvm@lists.linux.dev>; Thu, 23 Jul 2026 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832198; cv=none; b=AqQkhQpXsO42MlbaApDg1rEBEcAV+4tsypEyuGlxPfctXNdZmogQ4lOGZWseKjUArputDqUp8q8I/EtPkQbIryUJKpoUd+F5DJbRyCP58cBKwc9N4y1cQcxQpU8+DxWIb2LNvDsuem3hLxDQAebeJ+30XZuSv7urlx26wCWgV04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832198; c=relaxed/simple;
	bh=lDHcUQhjp+ufrTLqRx19uaAdtbMHK+VE9YGwgg5/+V4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=j7og1htZ8F2Il2mf2Ro7WMBqqdOjoOnXenuxMEIb3IR22GmPN66UP/fkVRPlR53Ut6wH97Cdx6TWji/tr7ijHoyjgA00OKkGa4ziWyLjdcB2JIU2kmIN5os5LgyIG9VL57NBrHaKDbYV+QxPxmTdTc9ZZqj/6UUYnavT4mBP4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqqUxDaX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqqUxDaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784832191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IlrZaGFLXFora76IVixmh9oJMX80VSTt1ddym/2VwJ0=;
	b=OqqUxDaXLvpzbSwWTRnsQQXlGJ36Nwr4VtIXP6koJlWsbjY7+ZoOwSlkq0/j6n2QcbBBHH
	65+/zLIHhEa43GFBuolRsDmNaepQ3qVudYWf7WRwFRGLFFAKm6G0Qvv+c6T5j3y3fM5YeI
	6xHVhZG8nXfx2IU0u1vwmdAVQrYDb2s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-v1vGiSMrP8qrJuQ9UbGoXQ-1; Thu,
 23 Jul 2026 14:43:10 -0400
X-MC-Unique: v1vGiSMrP8qrJuQ9UbGoXQ-1
X-Mimecast-MFC-AGG-ID: v1vGiSMrP8qrJuQ9UbGoXQ_1784832189
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11C4D1944B0D
	for <llvm@lists.linux.dev>; Thu, 23 Jul 2026 18:43:09 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 908C215A1;
	Thu, 23 Jul 2026 18:43:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc4,
 upstream-mainline, 248951dd)
Date: Thu, 23 Jul 2026 18:43:08 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <98378.126072314431000596@us-mta-544.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mk1-pTwshR1Q6Q4QgudOv5D0X9mY2u9vZXfQL9v4OF8_1784832189
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'hwmon-for-v7.2-rc5' of git://git.kernel.org/=
pub/scm/linux/kernel/git/groeck/linux-staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2694804967

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2694804967_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2694804967_aarch64_kernel_kcidb_tool_21693250_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2694804967_x86_64_kernel_kcidb_tool_21693247_9
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

