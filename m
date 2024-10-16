Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C118C33C
	for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729116731; cv=none; b=ZAA5u4iI9iwMPKY74mqJ1FBEjqA23jE/bn0lHCHkfsEK0bX80IvplopPkNZrMFxxQaUIbmvihR73/Dl+R1vX1Mi75vyeVHYl5dxZp1pFIzTC20N5uRcD4lQaf/t9gI/TnZMov8v8G/fLpfUSQsVHFJ2BqDvJkT3GWSd8rEPp4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729116731; c=relaxed/simple;
	bh=yWInCML9zjPUsdBSo1X+WJWAgOkbTtKSSw0niK5Cy8I=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=gCQUmUg1kHQZW+DpGm+HGjE10WdZiq3KHznfceKY7s8e5N+jmtX/13/T8ZjiHY99WgIL/+EXqsVZVWykZzkzLRuRzyoa7vv+eW32aXTuJYijmmPT1tNWq4UC9pJ148sf+LPP0nHy+qvpAAuHS0hWSnZm0SGX5QJRUxMwoS864/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZyhJ8jgG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZyhJ8jgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729116728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ugLpzmGdZJNxV5TdIqRMcuJFHVZvT6Kk8jtusDjjLSg=;
	b=ZyhJ8jgGFw7LQ/Eaqel/57U+VSyXz6+PLObP8en6mW4ReVdGMMs6biIqjvZ9AtEvbBBVzD
	OgXbuklvxnkVuJ5htY9exW37aWsJ4oxrOzDV5c4vON2YACE2Y632nem858reT+kksLPct6
	fls4b6Iei+VMz77RfkccARJDMCDzB54=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-qOEmMV56MuaRf_nD-UloFA-1; Wed,
 16 Oct 2024 18:12:07 -0400
X-MC-Unique: qOEmMV56MuaRf_nD-UloFA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81CE419560BA
	for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 22:12:06 +0000 (UTC)
Received: from [172.64.13.36] (unknown [10.30.32.93])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 12F1E19560A3;
	Wed, 16 Oct 2024 22:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, c964ced7)
Date: Wed, 16 Oct 2024 22:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <71318.124101618120700502@us-mta-634.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1499262081

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1499262081-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1499262081-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1499262081-x86_64-kernel-debug


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

