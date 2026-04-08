Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D439EF12
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636532; cv=none; b=m8CoSQ682AiPO5OjYDNUJqvH+zpELg/YMccJBFe4HJQrePfwtqWmbMJyh/ng1SpzKx8U0UFivtMltDsqeneVMQgg1LActmBBJIua+0226I7INeVZwkiLSIUBQ07sPZHJ+x7o819Aseipw6QVUc2Rsp7qQH44uKvXm9Uj4VzSvBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636532; c=relaxed/simple;
	bh=bzy31xQKDU1QllsKpr123MDsL194SrOWbf1PilFMjjE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=snrx7AvRHtrsFYSmd0SxyQBRoWH5kxSSVZpT/d0gPusBRLG61+ajg2iIglouXIN1ogir+7RmcjUMKOoO+H1E91Nap3nebnGmlxRJUzsW/wOkwHSOdDhCLpqBZNzCHVDZGQxEAiVBamaiheVofY+cDatuxohjG0Firo5ykgXHcuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hs9L8EUV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hs9L8EUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775636529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6HHz2usIvlJ2z/WnRL2Z/+97/OwseG2KARJOVUsSEC0=;
	b=hs9L8EUV0JG9gRQpcerTBr+BP+PVfw8WYN72NI2g8Wg4u9zhdR+NLXwAq/e2TVXbbJc0hU
	2P0G1IhKuhmo5aTLGVpmyMIXl2qfkxpz+8bSXIicY495ebfngECAHQq2P+Ug9QCffR8wuQ
	7xbIgtqjjQ22Sn/ZDrRU4IX3D7x4DIQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-7MZqjAh_NxuR2rBpB22Lvw-1; Wed,
 08 Apr 2026 04:22:08 -0400
X-MC-Unique: 7MZqjAh_NxuR2rBpB22Lvw-1
X-Mimecast-MFC-AGG-ID: 7MZqjAh_NxuR2rBpB22Lvw_1775636527
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D0531800372
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 08:22:07 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38AC61800762;
	Wed,  8 Apr 2026 08:22:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc7,
 upstream-mainline, 3036cd0d)
Date: Wed, 08 Apr 2026 08:22:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <95607.126040804220800223@us-mta-264.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8P633vWlpg8KQGzQ_1mNiBGjILHPrUhVWKP29aL7j7Q_1775636527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'ata-7.0-final' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/libata/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2435608516

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2435608516_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
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

