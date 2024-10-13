Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA5F41C71
	for <llvm@lists.linux.dev>; Sun, 13 Oct 2024 03:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728790932; cv=none; b=slZIfJzbO/7YMbcFqqE3QZ/a7BTDQIvaFa+i0/V9mKxWEL0lPdIDxx7IcFhBSTFqKxGrdNNMexEeygTTiwUqfzkcMS5v1d6NIMHRM+PosyzPoRicdBwhjE05Q/5oPpenxhsoBoENz4oFAM0EG7VO83OdiLiZ8ozExLMTf8xTIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728790932; c=relaxed/simple;
	bh=HOWgq+yOHZK/vUJgJ0Po2C827UeRQok6vOl080I0As8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HJ26JaOrLVMwK6dt30vdXjlEvQMe22O7T294Te6L7nR/Yi1qhl3Pm64bvJSbN4zG2nIjfz0S1WHoQQLPkULMizSeSXUNhibAEtJrzmaojUHZScKZO5UUfQlzuFjG4Ybtns4wsMqDQ7G9P2YcNfvIAl/h68ovskqnfau7IotPRs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L2xk3zan; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L2xk3zan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728790929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yCFdqFCrjJzpwtIQXhj/5zYqjoidEN/RIf0x4jrQX0s=;
	b=L2xk3zan2mz9i1egbn4MZ6iP1l4wz1tDN96WHFdm/eggCwZqxYN62KLjD6kOmb6Gdj77xY
	5mN+N2annrKUNhtiGE873yib0c/tzfK5Xi7qzAmn9BTJivPByPwKbsqJBYf6C5dQty3mpi
	Dfa5za1NAkNVdpoLo/dXm/GeuC/1k+o=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-Rv6_S4qgNuO-2jOBXAPlIQ-1; Sat,
 12 Oct 2024 23:42:07 -0400
X-MC-Unique: Rv6_S4qgNuO-2jOBXAPlIQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 880DE19560A2
	for <llvm@lists.linux.dev>; Sun, 13 Oct 2024 03:42:06 +0000 (UTC)
Received: from [172.64.0.80] (unknown [10.30.33.131])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 16DDF1956089;
	Sun, 13 Oct 2024 03:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc2,
 mainline.kernel.org-clang, 36c25451)
Date: Sun, 13 Oct 2024 03:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <29408.124101223420700496@us-mta-544.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'powerpc-6.12-4' of git://git.kernel.org/pub/=
scm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1493574947

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1493574947-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1493574947-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1493574947-x86_64-kernel-debug


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

