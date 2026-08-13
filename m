Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4102EEE80
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 04:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596191; cv=none; b=XMQduz6gvpdR7xK/BD9hDw7bmlerHVffmr6Ud7cswdY75jxAjiIyQdUumn8jezgarQalZvGM3rWZklnhActakny0biz1o4vEuEnCmGjzS7dWQyVB7ymBcuLiJkjwvg7DutOq8+JbhVUwIP6Kyah3wjSXzIz97jhZED1v1tyl7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596191; c=relaxed/simple;
	bh=ChGLA2JuHEq/2RUXOAMLIBohgll2r4M/Hvkmq7kfWIY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RS2qoTzZ9AluFGNxUO0cZAagm+BuxZYwW6bAuEqQnmhyHEnwhHVJK8sdqAZwE/TZzaajkSKD2AlysNUp6Pt4Y4QVY2hqeN+wlE3er3AuIYPh0dKO51yvi7Lf0avjJxaBzRA9MrJydlwfx/gVtIpVyHD0gAClWL5UUSVd2JUYP8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QWMSsQI7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QWMSsQI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786596189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pEd2UycXHcGJNSx9LFwGpoUd7sVu4slElgcty/1TkVc=;
	b=QWMSsQI7O7i6fzMlcRhPnVmQrIkYRXNeAvZtGGP0qqjL0ICAOEMkyPDDSqxg0+I+c4TCq2
	RLya4aSx7t2LJTquzC/qE//YEtMNNBWB3BzGncGEXRFJBXnAs/0rZp6UVGW9uJFmODjU80
	/CbzSwxdIVhNVhk4Wod94Bx2W/QbrfI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-digxgTluPI6S0H4oaDQSQg-1; Thu,
 13 Aug 2026 00:43:07 -0400
X-MC-Unique: digxgTluPI6S0H4oaDQSQg-1
X-Mimecast-MFC-AGG-ID: digxgTluPI6S0H4oaDQSQg_1786596186
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C1811956040
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 04:43:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 75A95180049F;
	Thu, 13 Aug 2026 04:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc7,
 upstream-mainline, 3d6d8176)
Date: Thu, 13 Aug 2026 04:43:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <52389.126081300430700329@us-mta-121.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AeRt3RNCjX3s9HhIlqg9CFFyeEuT1hPxcks-U_e0s-Q_1786596186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2754783269

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2754783269_aarch64_kernel_kcidb_tool_21861226_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2754783269_x86_64_kernel_kcidb_tool_21861222_9
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

