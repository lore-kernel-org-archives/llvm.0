Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9BD9463
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780723932; cv=none; b=M9zkUHOKSXwuKOp9POt3DFE1ug9hZ9nqxJZjvGp5R/iq2mVsEA1yLIXP0EvDrKYMPxRGGCVNmTeO4j8+pSJj+Ky2pRt5Sb7xVkZMRlrPobMq/3Muh401Ve54Pk6gDeBcSj7YmmhgfTp7/s9Tk0lbbOo5E1ocnUEBAGbl5YnDvzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780723932; c=relaxed/simple;
	bh=wf3Jn9btrsEjr1fvm8dKMi2Z9q6BAEF0otYbXpfwUJ8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ceg1+oKyHa3epvO9jOjZLjY9AvcmTvzjeSYCrGfL7OQeYu0BOHFHL9KSY1n2fEdC6PgGrUArIU9ezV3s8OhuXPmbVowEIc28jhP57e4DW0LBS1UNvksRmCz/JjZRahYyxg8U09ZHpk9GbqLdnB2w/AJWjb9Xka/sn35wHa9hqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TjKmxERZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TjKmxERZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780723929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C3utwbrUuS9M8tuTM0NhS4xemF8aNqlHvCirqnLLD2I=;
	b=TjKmxERZ4Wljew34wpipE8r/+fWUISINBc33d0UqLG3AfRZzYqqjLY7YC7tuP9P89Bmt1e
	vYBw4nwzOJwRZYKpMb0YLEEizPIU+f7xJAA6ZcejLmyNBX7vg2E4M65KaPLP7Ewsvjb8T3
	48Za30EeZsTa2y128BydeexGmPhucWA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-IS9Z5vD5MZSOWH5fPunqWQ-1; Sat,
 06 Jun 2026 01:32:07 -0400
X-MC-Unique: IS9Z5vD5MZSOWH5fPunqWQ-1
X-Mimecast-MFC-AGG-ID: IS9Z5vD5MZSOWH5fPunqWQ_1780723926
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B51BA180044D
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 05:32:06 +0000 (UTC)
Received: from [172.20.220.30] (unknown [10.30.44.120])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5109E3000210;
	Sat,  6 Jun 2026 05:32:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, a8dc5f60)
Date: Sat, 06 Jun 2026 05:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <99473.126060601320700311@us-mta-7.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vYopnQ71SVZqyrnt63ajOhTkQ3MU14UnK-Bs5bMI6tU_1780723926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'nfs-for-7.1-2' of git://git.linux-nfs.org/pr=
ojects/trondmy/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2580101802

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2580101802_ppc64le_kernel

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

