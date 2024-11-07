Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C5EC0
	for <llvm@lists.linux.dev>; Thu,  7 Nov 2024 22:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731018732; cv=none; b=d2m4JNGOJrcTXydG8/TMV1gfF053E8KbCTGRn/dRU3S9mfBhcOyzBXndxJO5n0fZOZ+jywBoFs56nWaY/6LRD0ImOMrK0/UGNbfF+yYoDSAaeZ1j8nJyjGM3+u2Jft/0w/zHX9AO+SGldwIANftUFvvuDbuOQO+CrsQxt3cLXg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731018732; c=relaxed/simple;
	bh=WFVBchrQ196e6wsI9gB+yJafxuJnfNjoXMCNn2mDU/E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=q6iW+ZRuLvNBhJcbum+miOxyqogmuwJulJJABcsxHMtSHssuC0QsoNuVaSBM3d6dMqFmH2k3ywcap6NqkWfFOTVFrR17heOPiu8LaoF64JMnIZddApY1PVDtDAv+LvUsx+IZWq8XqCXR/QsPVT8n97EsgVQuMGQo6LtnXn4UWck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwxk3MGR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwxk3MGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731018728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0ldzxRaHtzImKB9HOXcdH3LnypaUGZwcPGO2rc9V6SQ=;
	b=fwxk3MGRuQXJ+2sDRCfcuBu2df9XJZFQSugqStZl7cSPnkmvTtFzMuQe58QQYvbZRX/+4A
	DyiAHngvsteywtetXbxkpic7u7wR0yuYP+gvJrjF4VkWKY7nodo1uYJkLlwMnmpz/TQAVb
	vK5g5SEFnTK9Q2Vk0HOYJbYQzsayFyo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-riEqAIgYNCqxdx8_66Gz_Q-1; Thu,
 07 Nov 2024 17:32:07 -0500
X-MC-Unique: riEqAIgYNCqxdx8_66Gz_Q-1
X-Mimecast-MFC-AGG-ID: riEqAIgYNCqxdx8_66Gz_Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E89C19560BE
	for <llvm@lists.linux.dev>; Thu,  7 Nov 2024 22:32:06 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D926D1953880;
	Thu,  7 Nov 2024 22:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, bfc64d9b)
Date: Thu, 07 Nov 2024 22:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <28866.124110717320700461@us-mta-210.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i7ReQnDPEs3OShY-XOm5fzGlvA2zPdEEgjJupoAN7UA_1731018726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.12-rc7' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1532249301

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1532249301-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1532249301-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1532249301-x86_64-kernel-debug


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

